/*
https://docs.nestjs.com/controllers#controllers
*/
import { ApiOkResponse, ApiTags } from '@nestjs/swagger';
import { wrapResponse } from '/@/common/utils/swagger';
import { Body, Controller, Get, Post, Query } from '@nestjs/common';
import { PageOptionsDto } from '/@/common/dtos/page-options.dto';
import { SkipAuth } from '/@/decorators/skip-auth.decorator';
import {
  SysDemoItemRespDto,
  SysDemoAddReqDto,
  SysDemoDeleteReqDto,
  SysDemoUpdateReqDto,
} from './demo.dto';
import { DemoService } from './demo.service';

@ApiTags('Demo - 示例')
@Controller('demo')
export class DemoController {
  constructor(private demoService: DemoService) {}

  // 添加
  @Post('add')
  @ApiOkResponse({
    type: wrapResponse(),
  })
  async add(@Body() body: SysDemoAddReqDto) {
    await this.demoService.addJob(body);
  }

  // 删除
  @Post('delete')
  @ApiOkResponse({
    type: wrapResponse(),
  })
  async delete(@Body() body: SysDemoDeleteReqDto) {
    await this.demoService.deleteDemo(body.id);
  }

  // 修改
  @Post('update')
  @ApiOkResponse({
    type: wrapResponse(),
  })
  async update(@Body() body: SysDemoUpdateReqDto) {
    await this.demoService.updateDemo(body);
  }

  // 获取分页
  @Get('page')
  @ApiOkResponse({
    type: wrapResponse({
      type: SysDemoItemRespDto,
      struct: 'page',
    }),
  })
  async page(@Query() query: PageOptionsDto) {
    return await this.demoService.getDemoByPage(query.page, query.limit);
  }
}
