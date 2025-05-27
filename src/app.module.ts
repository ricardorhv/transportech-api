import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { TransporteModule } from './transporte/transporte.module';
import { PrismaModule } from './prisma/prisma.module';
import { EnderecoModule } from './endereco/endereco.module';
import { ViagemModule } from './viagem/viagem.module';

@Module({
  imports: [TransporteModule, PrismaModule, EnderecoModule, ViagemModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
