import type {
  IPaginationRespData,
  IListRespData,
} from '/@/interfaces/response';

import {
  ConfigDictAddReqDto,
  ConfigDictRespItemDto,
  ConfigDictUpdateReqDto,
} from './dict.dto';
import {  Like } from 'typeorm';

import { Injectable } from '@nestjs/common';
import { AbstractService } from '/@/common/abstract.service';
import { SysDictionaryEntity } from '/@/entities/sys-dictionary.entity';
import { isEmpty, omit } from 'lodash';
import { ApiFailedException } from '/@/exceptions/api-failed.exception';
import { ErrorEnum } from '/@/constants/errorx';
import { TREE_ROOT_NODE_ID } from '/@/constants/core';
import { AppConfigService } from '/@/shared/services/app-config.service';

@Injectable()
export class ConfigDictService extends AbstractService {
  constructor(private readonly configService: AppConfigService) {
    super();
  }

  async getConfigDictDataByPage(
    page: number,
    limit: number,
    parentId: number,
  ): Promise<IPaginationRespData<ConfigDictRespItemDto>> {
    const [rows, count] =
      await this.entityManager.findAndCount<ConfigDictRespItemDto>(
        SysDictionaryEntity,
        {
          where: {
            parentId,
          },
          skip: (page - 1) * limit,
          take: limit,
        },
      );

    return rows.toPage({
      limit,
      page,
      total: count,
    });
  }

  async getConfigDictPage(page: number, limit: number, name: string) {
    const [rows, count] =
      await this.entityManager.findAndCount<ConfigDictRespItemDto>(
        SysDictionaryEntity,
        {
          where: {
            type: 1,
            name: Like(`%${name}%`)
          },
          skip: (page - 1) * limit,
          take: limit,
        },
      );

    return rows.toPage({
      page,
      limit,
      total: count,
    });
  }

  async getConfigDictAll(): Promise<IListRespData<ConfigDictRespItemDto>> {
    const rawData = await this.entityManager.find<ConfigDictRespItemDto>(
      SysDictionaryEntity,
    );

    // 列表转换为tree数据
    const groupData: any = (data: any[]) => {
      const groups = {};
      data.forEach((item) => {
        const { id, parentId } = item;
        if (parentId === id) {
          groups[id] = { ...item, dataList: [] };
        } else if (groups[parentId]) {
          groups[parentId].dataList.push({
            dictLabel: item.name,
            dictValue: item.value,
          });
        } else {
          const parent = data.find((p) => p.id === parentId);
          if (parent) {
            groups[parentId] = {
              dictType: parent.uniqueKey,
              dataList: [{ dictLabel: item.name, dictValue: item.value }],
            };
          }
        }
      });
      return Object.values(groups);
    };

    const groupedData = groupData(rawData);
    return groupedData.toList();
  }

  async deleteConfigDict(id: number): Promise<void> {
    if (id <= this.configService.appConfig.protectSysDictionaryMaxId) {
      throw new ApiFailedException(ErrorEnum.CODE_1203);
    }

    const config = await this.entityManager.findOne(SysDictionaryEntity, {
      select: ['parentId'],
      where: {
        id,
      },
    });

    // 删除字典集时则需要判断是否存在字典配置项
    if (config.parentId === TREE_ROOT_NODE_ID) {
      const countChild = await this.entityManager.count(SysDictionaryEntity, {
        where: {
          parentId: id,
        },
      });

      if (countChild > 0) {
        throw new ApiFailedException(ErrorEnum.CODE_1204);
      }
    }

    await this.entityManager.delete(SysDictionaryEntity, { id });
  }

  async addConfigDict(item: ConfigDictAddReqDto): Promise<void> {
    if (item.parentId !== TREE_ROOT_NODE_ID) {
      // if dict data, check parent dict is exists
      const parent = await this.entityManager.findOne(SysDictionaryEntity, {
        select: ['id'],
        where: {
          parentId: 0,
          id: item.parentId,
        },
      });

      if (isEmpty(parent)) {
        throw new ApiFailedException(ErrorEnum.CODE_1201);
      }
    }

    const dict = await this.entityManager.findOne(SysDictionaryEntity, {
      select: ['id'],
      where: {
        uniqueKey: item.uniqueKey,
      },
    });
    if (!isEmpty(dict) && item.type === 0) {
      throw new ApiFailedException(ErrorEnum.CODE_1202);
    }

    await this.entityManager.insert(SysDictionaryEntity, item);
  }

  async updateConfigDict(item: ConfigDictUpdateReqDto): Promise<void> {
    if (item.parentId !== TREE_ROOT_NODE_ID) {
      // if dict data, check parent dict is exists
      const parent = await this.entityManager.findOne(SysDictionaryEntity, {
        select: ['id'],
        where: {
          parentId: 0,
          id: item.parentId,
        },
      });

      if (isEmpty(parent)) {
        throw new ApiFailedException(ErrorEnum.CODE_1201);
      }
    }

    await this.entityManager.update(
      SysDictionaryEntity,
      { id: item.id },
      {
        ...omit(item, 'id'),
      },
    );
  }
}
