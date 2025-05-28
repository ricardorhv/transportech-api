import { Injectable } from '@nestjs/common';
import { StatusViagem, TipoViagem } from 'generated/prisma';
import { PrismaService } from 'src/prisma/prisma.service';
import { CreateViagemDto } from './dto/create-viagem.dto';
import { UpdateViagemDto } from './dto/update-viagem.dto';

@Injectable()
export class ViagemService {
  constructor(private prisma: PrismaService) {}

  async create(createViagemDto: CreateViagemDto) {
    const viagem = await this.prisma.viagem.create({
      data: {
        ...createViagemDto,
      },
    });
    return viagem;
  }

  async findAll() {
    const viagem = await this.prisma.viagem.findMany();
    return viagem;
  }

  async findOne(id: string) {
    const viagem = await this.prisma.viagem.findUnique({
      where: {
        id,
      },
    });
    return viagem;
  }

  async update(id: string, updateViagemDto: UpdateViagemDto) {
    const viagem = await this.prisma.viagem.update({
      data: {
        ...updateViagemDto,
        tipoViagem: updateViagemDto.tipoViagem as TipoViagem,
        status: updateViagemDto.status as StatusViagem,
      },
      where: {
        id,
      },
    });
    return viagem;
  }

  // remove(id: string) {
  //   return `This action removes a #${id} viagem`;
  // }
}
