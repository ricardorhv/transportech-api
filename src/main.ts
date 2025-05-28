import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

const methods = ['GET', 'POST', 'PUT', 'PATCH', 'DELETE'];

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  app.enableCors({ methods });
  await app.listen(process.env.PORT ?? 3000);
}
bootstrap();
