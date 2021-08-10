import { Component, OnInit } from '@angular/core';


@Component({
  selector: 'app-cripto',
  templateUrl: './cripto.component.html',
  styleUrls: ['./cripto.component.css']
})
export class CriptoComponent implements OnInit {

  constructor() { }

  ngOnInit(): void {
  }
clickAddTodo() {
  alert('Compra exitosa!');
}
}
