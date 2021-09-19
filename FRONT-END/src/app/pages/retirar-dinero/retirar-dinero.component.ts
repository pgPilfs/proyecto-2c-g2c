import { Component, OnInit } from '@angular/core';
import {FormControl, Validator, Validators} from '@angular/forms';

@Component({
  selector: 'app-retirar-dinero',
  templateUrl: './retirar-dinero.component.html',
  styleUrls: ['./retirar-dinero.component.css']
})
export class RetirarDineroComponent implements OnInit {

  msjVal = 'La operacion no se realizó correctamente';

  montoRetiro: FormControl;

  constructor(){
    this.montoRetiro = new FormControl('0.00', [Validators.required,
       Validators.pattern('/^([0-9]*(\.?[0-9]?[0-9]?)?)/g'),
       Validators.min(0.00), Validators.max(100000.00)
    ]);
  }


  ngOnInit(): void {
  }

  // tslint:disable-next-line: typedef
  RealizarOp(){
    // Esta funcion se va a ejecutar al hacer click en el boton "Realizar operacion"
    // Debe mostra un mensaje de aceptacion en caso de que la operacion sea válida
    // o un mensaje de error en caso contrario
  }

}
