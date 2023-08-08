import { Injectable } from '@nestjs/common';
import { isEmpty, omit, uniq } from 'lodash';
import { In, Not } from 'typeorm';
import {
  SysUserAddReqDto,
  SysUserPageItemRespDto,
  SysUserRdpjInfoRespDto,
  SysUserUpdateReqDto,
} from './user.dto';
import { AbstractService } from '/@/common/abstract.service';
import { encryptByMD5 } from '/@/common/utils/cipher';
import { TREE_ROOT_NODE_ID } from '/@/constants/core';
import { ErrorEnum } from '/@/constants/errorx';
import { SysDeptEntity } from '/@/entities/sys-dept.entity';
import { SysJobEntity } from '/@/entities/sys-job.entity';
import { SysRoleEntity } from '/@/entities/sys-role.entity';
import { SysUserEntity } from '/@/entities/sys-user.entity';
import { ApiFailedException } from '/@/exceptions/api-failed.exception';
import { SysDeptRepository } from '/@/repositories/sys-dept.repository';
import { AppConfigService } from '/@/shared/services/app-config.service';
import { AppGeneralService } from '/@/shared/services/app-general.service';

@Injectable()
export class SystemUserService extends AbstractService {
  constructor(
    private readonly generalService: AppGeneralService,
    private readonly configService: AppConfigService,
    private readonly sysDeptRepo: SysDeptRepository,
  ) {
    super();
  }

  async getUserByPage(page: number, limit: number, queryDeptId: number) {
    // 需要查询的部门
    let deptIds: number[] = [];
    if (queryDeptId === TREE_ROOT_NODE_ID) {
      const ret = await this.entityManager.find(SysDeptEntity, {
        select: ['id'],
      });
      deptIds = ret.map((e) => e.id);
    } else {
      deptIds = [queryDeptId];
    }

    const [rows, count] = await this.entityManager
      .createQueryBuilder(SysUserEntity, 'user')
      .leftJoinAndMapOne(
        'user.dept',
        SysDeptEntity,
        'dept',
        'user.deptId = dept.id',
      )
      .leftJoinAndMapOne(
        'user.job',
        SysJobEntity,
        'job',
        'user.job_id = job.id',
      )
      .leftJoinAndMapMany(
        'user.roles',
        SysRoleEntity,
        'roles',
        'JSON_CONTAINS(user.role_ids, JSON_ARRAY(roles.id))',
      )
      // .where('user.deptId = :deptId', { deptId: queryDeptId })
      // .orWhere('user.deptId IN (:...deptIds)', { deptIds: deptIds })
      // .andWhere('user.id != :id', { id: 1 })
      .where('user.id != :id', { id: 1 })
      .skip((page - 1) * limit)
      .take(limit)
      .getManyAndCount();
    return rows
      .map((e: any) => new SysUserPageItemRespDto(e))
      .toPage({
        page,
        limit,
        total: count,
      });
  }

  async updateUserPassword(uid: number, pwd: string): Promise<void> {
    if (this.generalService.isRootUser(uid)) {
      throw new Error(`User ${uid} illegally changes the password of the root`);
    }

    const encryPwd = encryptByMD5(
      `${pwd}${this.configService.appConfig.userPwdSalt}`,
    );

    await this.entityManager.update(
      SysUserEntity,
      { id: uid },
      { password: encryPwd },
    );
  }

  async deleteUser(uid: number): Promise<void> {
    if (this.generalService.isRootUser(uid)) {
      throw new Error(`User ${uid} illegally delete root`);
    }

    await this.entityManager.delete(SysUserEntity, { id: uid });
  }

  async getUserRoleDeptProfJobInfo(edituid: number) {
    if (this.generalService.isRootUser(edituid)) {
      throw new Error(`User ${edituid} illegally obtaining root info`);
    }

    const depts = await this.entityManager.find(SysDeptEntity, {
      select: ['id', 'name', 'parentId'],
    });

    const jobs = await this.entityManager.find(SysJobEntity, {
      select: ['id', 'name'],
    });

    const allRoles = await this.entityManager.find(SysRoleEntity, {
      select: ['id', 'parentId', 'name'],
    });

    return new SysUserRdpjInfoRespDto(depts, jobs, allRoles);
  }

  async addUser(item: SysUserAddReqDto): Promise<void> {
    await this.checkJobOrDeptOrProfExists(item.jobId, item.deptId);

    // 创建用户
    await this.entityManager.insert(SysUserEntity, {
      ...omit(item, 'roleIds'),
      roleIds: uniq(item.roleIds),
      password: this.generalService.generateUserPassword(),
    });
  }

  async updateUser(item: SysUserUpdateReqDto): Promise<void> {
    await this.checkJobOrDeptOrProfExists(item.jobId, item.deptId);

    // 更新用户
    await this.entityManager.update(
      SysUserEntity,
      { id: item.id },
      {
        ...omit(item, ['roleIds', 'id']),
        roleIds: uniq(item.roleIds),
      },
    );
  }

  /**
   * 检查Job、Dept、Profession ID是否存在，不存在则报错
   */
  private async checkJobOrDeptOrProfExists(
    jobId: number,
    deptId: number,
  ): Promise<void> {
    const jobInfo = await this.entityManager.findOne(SysJobEntity, {
      select: ['id'],
      where: {
        id: jobId,
      },
    });

    if (isEmpty(jobInfo)) {
      throw new ApiFailedException(ErrorEnum.CODE_1102);
    }

    const deptInfo = await this.entityManager.findOne(SysDeptEntity, {
      select: ['id'],
      where: {
        id: deptId,
      },
    });

    if (isEmpty(deptInfo)) {
      throw new ApiFailedException(ErrorEnum.CODE_1104);
    }
  }
}
