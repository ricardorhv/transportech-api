import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { TransporteModule } from './transporte/transporte.module';
import { PrismaModule } from './prisma/prisma.module';
import { EnderecoModule } from './endereco/endereco.module';
import { UsuarioModule } from './usuario/usuario.module';

@Module({
  imports: [TransporteModule, PrismaModule, EnderecoModule, UsuarioModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
