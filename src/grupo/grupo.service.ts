import { Injectable } from '@nestjs/common';
import { CreateGrupoDto } from './dto/create-grupo.dto';
import { UpdateGrupoDto } from './dto/update-grupo.dto';
import { Prisma } from 'generated/prisma';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class GrupoService {
  constructor(private prisma: PrismaService){}

  async create(createGrupoDto: CreateGrupoDto) {
     const grupo = await this.prisma.grupo.create({
      data: createGrupoDto
    });
    return grupo;
  }

  async findAll() {
    const listagrupos = await this.prisma.grupo.findMany();
    return listagrupos;
  }

  async findOne(id: string) {
    const grupo = await this.prisma.grupo.findUnique({
      where:{
        id,
      }
    });
    return grupo;
  }

  async update(id: string, updateGrupoDto: UpdateGrupoDto) {
    const grupoatualizado = await this.prisma.grupo.update({
      data:updateGrupoDto,
      where:{
        id,
      }
    })
    return grupoatualizado;
  }

  async remove(id: string) {
    await this.prisma.grupo.delete({
      where:{
        id,
      }
    });
  }
}
