import { NumberField, StringField } from '/@/decorators/field.decorator';
import { ApiProperty } from '@nestjs/swagger';
import { SysDemoEntity } from '/@/entities/sys-demo.entity';

// 添加
export class SysDemoAddReqDto {
  @ApiProperty({
    description: '用户名,2-50位之间',
  })
  @StringField({
    minLength: 2,
    maxLength: 50,
    required: false,
  })
  username?: string;

  @ApiProperty({
    description: '昵称,2-50位之间',
  })
  @StringField({
    minLength: 2,
    maxLength: 50,
    required: false,
  })
  nickname: string;

  @NumberField({
    min: 0,
    int: true,
    required: false,
  })
  orderNum?: number;

  @StringField({
    required: false,
  })
  remark?: string;

  @NumberField({
    min: 0,
    max: 1,
    int: true,
    required: false,
  })
  status: number;
}

// 删除
export class SysDemoDeleteReqDto {
  @NumberField({
    int: true,
    min: 1,
  })
  id: number;
}

// 修改
export class SysDemoUpdateReqDto extends SysDemoAddReqDto {
  @NumberField({
    int: true,
    min: 1,
  })
  id: number;
}

//--------------------------------------------------------------------------------
//------------------------------------- resp -------------------------------------
//--------------------------------------------------------------------------------

export class SysDemoItemRespDto {
  fullName: string;
  id: number;
  name: string;
  username: string;
  nickname: string;
  status: number;
  orderNum: number;
  remark: string;
  type: number;
  uniqueKey: string;

  constructor(entity: SysDemoEntity) {
    this.id = entity.id;
    this.username = entity.username;
    this.orderNum = entity.orderNum;
    this.nickname = entity.nickname;
    this.remark = entity.remark;
    this.status = entity.status;
  }
}
