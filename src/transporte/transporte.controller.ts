import {
  Body,
  Controller,
  Delete,
  Get,
  HttpCode,
  Param,
  Patch,
  Post,
} from '@nestjs/common';
import { CreateTransporteDto } from './dto/create-transporte.dto';
import { UpdateTransporteDto } from './dto/update-transporte.dto';
import { TransporteService } from './transporte.service';

@Controller('transporte')
export class TransporteController {
  constructor(private readonly transporteService: TransporteService) {}

  @Post()
  create(@Body() createTransporteDto: CreateTransporteDto) {
    return this.transporteService.create(createTransporteDto);
  }

  @Get()
  findAll() {
    return this.transporteService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.transporteService.findOne(id);
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() updateTransporteDto: UpdateTransporteDto,
  ) {
    return this.transporteService.update(id, updateTransporteDto);
  }

  @HttpCode(204)
  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.transporteService.remove(id);
  }
}
