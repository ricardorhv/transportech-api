import { Module } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { EnderecoController } from './endereco.controller';
import { EnderecoService } from './endereco.service';

@Module({
  controllers: [EnderecoController],
  providers: [EnderecoService, PrismaService],
})
export class EnderecoModule {}
