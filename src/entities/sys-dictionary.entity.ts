import { Column, Entity } from 'typeorm';
import { AbstractEntity } from '/@/common/abstract.entity';

@Entity({ name: 'sys_dictionary' })
export class SysDictionaryEntity extends AbstractEntity {
  @Column({
    name: 'parent_id',
    type: 'int',
    unsigned: true,
    default: 0,
    comment: '0=配置集 !0=父级id',
  })
  parentId: number;

  @Column({ type: 'varchar', length: 50, comment: '名称' })
  name: string;

  @Column({
    type: 'tinyint',
    width: 2,
    unsigned: true,
    default: 1,
    comment:
      '类型: 1=一级 2=二级',
  })
  type: number;

  @Column({
    name: 'unique_key',
    type: 'varchar',
    length: 50,
    default: '',
    comment: '标识',
  })
  uniqueKey: string;

  @Column({ type: 'varchar', length: 2048, default: '', comment: '配置值' })
  value: string;

  @Column({
    type: 'tinyint',
    width: 1,
    unsigned: true,
    default: 1,
    comment: '状态:  0=禁用 1=开启',
  })
  status: number;

  @Column({
    name: 'order_num',
    type: 'int',
    unsigned: true,
    default: 0,
    comment: '排序值',
  })
  orderNum: number;

  @Column({ type: 'varchar', length: 200, default: '', comment: '备注' })
  remark: string;
}
