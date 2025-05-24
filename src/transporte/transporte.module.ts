import { Module } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { TransporteController } from './transporte.controller';
import { TransporteService } from './transporte.service';

@Module({
  controllers: [TransporteController],
  providers: [TransporteService, PrismaService],
})
export class TransporteModule {}
