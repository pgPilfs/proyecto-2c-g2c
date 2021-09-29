import { Component, OnInit} from '@angular/core';
import { NavigationEnd, Router } from '@angular/router';
import {filter} from 'rxjs/operators';
import { DataService } from '../../service/data.service';
import { ClienteService, Persona } from '../../service/cliente.service';
import { convertCompilerOptionsFromJson } from 'typescript';

@Component({
  selector: 'adm-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {

  public isCollapsed = true;
  public expression:boolean = false;
  cliente: Persona;

  toggleMenu() {
    this.isCollapsed = !this.isCollapsed;
  }

  constructor(private dataService: DataService, private clienteService: ClienteService) {}

  ngOnInit(): void {
    this.dataService.bandera$.subscribe((res)=>{
      this.clienteService.obtenerUsuario(res).subscribe((res2)=>{
        this.cliente = res2;
        this.expression = true;
      })
    })
  }

  salir(){
    this.expression = false;
  }



}
