import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { EnderecoModule } from './endereco/endereco.module';
import { GrupoModule } from './grupo/grupo.module';
import { PrismaModule } from './prisma/prisma.module';
import { TransporteModule } from './transporte/transporte.module';
import { UsuarioModule } from './usuario/usuario.module';
import { ViagemModule } from './viagem/viagem.module';

@Module({
  imports: [
    TransporteModule,
    PrismaModule,
    EnderecoModule,
    ViagemModule,
    GrupoModule,
    UsuarioModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
