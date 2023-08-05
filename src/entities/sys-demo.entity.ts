import { Column, Entity } from 'typeorm';
import { AbstractEntity } from '/@/common/abstract.entity';

@Entity({ name: 'sys_demo' })
export class SysDemoEntity extends AbstractEntity {
  @Column({ type: 'varchar', length: 50, comment: '姓名' })
  username: string;

  @Column({ type: 'varchar', length: 50, default: '', comment: '昵称' })
  nickname: string;

  @Column({
    type: 'tinyint',
    width: 1,
    unsigned: true,
    default: 1,
    comment: '状态:  0=禁用 1=开启	',
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
