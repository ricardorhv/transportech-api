import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { CreateTransporteDto } from './dto/create-transporte.dto';
import { UpdateTransporteDto } from './dto/update-transporte.dto';

@Injectable()
export class TransporteService {
  constructor(private prisma: PrismaService) {}

  async create(createTransporteDto: CreateTransporteDto) {
    const transport = await this.prisma.transporte.create({
      data: createTransporteDto,
    });
    return transport;
  }

  async findAll() {
    const transports = await this.prisma.transporte.findMany();
    return transports;
  }

  async findOne(id: string) {
    const transport = await this.prisma.transporte.findUnique({
      where: {
        id,
      },
    });
    return transport;
  }

  async update(id: string, updateTransporteDto: UpdateTransporteDto) {
    const updatedTransport = await this.prisma.transporte.update({
      data: updateTransporteDto,
      where: {
        id,
      },
    });
    return updatedTransport;
  }

  async remove(id: string) {
    await this.prisma.transporte.delete({
      where: {
        id,
      },
    });
  }
}
