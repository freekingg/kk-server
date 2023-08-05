import { DemoService } from './demo.service';
/*
https://docs.nestjs.com/modules
*/

import { Module } from '@nestjs/common';
import { DemoController } from './demo.controller';

@Module({
  imports: [],
  controllers: [DemoController],
  providers: [DemoService],
})
export class DemoModule {}
