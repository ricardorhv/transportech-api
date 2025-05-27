import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { TransporteModule } from './transporte/transporte.module';
import { PrismaModule } from './prisma/prisma.module';
import { EnderecoModule } from './endereco/endereco.module';
<<<<<<< HEAD
import { GrupoModule } from './grupo/grupo.module';

@Module({
  imports: [TransporteModule, PrismaModule, EnderecoModule, GrupoModule],
=======
import { UsuarioModule } from './usuario/usuario.module';

@Module({
  imports: [TransporteModule, PrismaModule, EnderecoModule, UsuarioModule],
>>>>>>> 332d7e7466d9ae7d6713a5b8dd3eb4e465117578
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
