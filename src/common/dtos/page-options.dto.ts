import { ApiProperty } from '@nestjs/swagger';
import { NumberField } from '/@/decorators/field.decorator';

export class PageOptionsDto {
  @NumberField({
    min: 1,
  })
  @ApiProperty({
    description: '页码',
  })
  page: number;

  @NumberField({
    min: 1,
  })
  @ApiProperty({
    description: '条数',
  })
  limit: number;
}
