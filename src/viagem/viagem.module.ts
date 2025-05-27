import { Module } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { ViagemController } from './viagem.controller';
import { ViagemService } from './viagem.service';

@Module({
  controllers: [ViagemController],
  providers: [ViagemService, PrismaService],
})
export class ViagemModule {}
