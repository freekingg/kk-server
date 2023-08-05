/*
https://docs.nestjs.com/providers#services
*/
import { AbstractService } from '/@/common/abstract.service';
import { Injectable } from '@nestjs/common';
import { omit } from 'lodash';
import {
  SysDemoItemRespDto,
  SysDemoAddReqDto,
  SysDemoUpdateReqDto,
} from './demo.dto';
import { SysDemoEntity } from '/@/entities/sys-demo.entity';

@Injectable()
export class DemoService extends AbstractService {
  // 添加数据
  async addJob(item: SysDemoAddReqDto): Promise<void> {
    await this.entityManager.insert(SysDemoEntity, item);
  }

  // 删除数据
  async deleteDemo(id: number): Promise<void> {
    await this.entityManager.delete(SysDemoEntity, { id });
  }

  // 修改
  async updateDemo(item: SysDemoUpdateReqDto): Promise<void> {
    await this.entityManager.update(
      SysDemoEntity,
      { id: item.id },
      omit(item, 'id'),
    );
  }

  // 获取分页
  async getDemoByPage(page: number, limit: number) {
    const [rows, count] =
      await this.entityManager.findAndCount<SysDemoItemRespDto>(SysDemoEntity, {
        select: ['id', 'orderNum', 'username', 'nickname', 'status'],
        skip: (page - 1) * limit,
        take: limit,
      });

    return rows.toPage({
      page,
      limit,
      total: count,
    });
  }
}
