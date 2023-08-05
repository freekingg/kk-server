import { ValueTransformer } from 'typeorm';
export class JsonTransformer implements ValueTransformer {
  to(data: object): string {
    try {
      return JSON.stringify(data); // 将 JSON 对象转换为字符串
    } catch (error) {
      // 在转换过程中出现异常的处理逻辑
      console.log('Error while transforming data to JSON string:', error);
      return null;
    }
  }

  from(data: string): object {
    try {
      return JSON.parse(data); // 将字符串转换为 JSON 对象
    } catch (error) {
      // 在转换过程中出现异常的处理逻辑
      console.log('Error while transforming JSON string to data:', error);
      return null;
    }
  }
}
