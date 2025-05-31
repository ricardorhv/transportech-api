import {
  ConflictException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { CreateUsuarioDto } from './dto/create-usuario.dto';
import { SignInDto } from './dto/sign-in.dto';
import { UpdateUsuarioDto } from './dto/update-usuario.dto';

@Injectable()
export class UsuarioService {
  constructor(private prisma: PrismaService) {}

  async signIn(signInDto: SignInDto) {
    const existeUsuario = await this.prisma.usuario.findUnique({
      where: {
        email: signInDto.email,
        senha: signInDto.senha,
      },
    });

    if (!existeUsuario) {
      throw new NotFoundException({
        message: 'Email ou senha inválidos!',
      });
    }

    return existeUsuario;
  }

  async create(createUsuarioDto: CreateUsuarioDto) {
    const existeEmail = await this.prisma.usuario.findUnique({
      where: {
        email: createUsuarioDto.email,
      },
    });

    if (existeEmail) {
      throw new ConflictException({
        message: 'Email já existe!',
      });
    }

    const novoUsuario = await this.prisma.usuario.create({
      data: createUsuarioDto,
    });
    return novoUsuario;
  }

  async findAll() {
    const usuarios = await this.prisma.usuario.findMany();
    return usuarios;
  }

  async findOne(id: string) {
    const usuario = await this.prisma.usuario.findUnique({
      where: {
        id,
      },
    });
    return usuario;
  }

  async update(id: string, updateUsuarioDto: UpdateUsuarioDto) {
    const usuarioAtualizado = await this.prisma.usuario.update({
      data: updateUsuarioDto,
      where: {
        id,
      },
    });
    return usuarioAtualizado;
  }

  remove(id: string) {
    return this.prisma.usuario.delete({
      where: {
        id,
      },
    });
  }
}
