import { Component, OnInit, Input } from '@angular/core';
import { NgbActiveModal, NgbModal } from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'app-pago-servicios',
  template: `
    <div class="modal-header">
      <h4 class="modal-title">{{name}}</h4>
      <button type="button" class="close" aria-label="Close" (click)="activeModal.dismiss('Cross click')">
        <span aria-hidden="true">&times;</span>
      </button>
    </div>
    <div class="modal-body">
    <a href="{{ref}}" class="btn btn-warning">{{body}}</a>
    </div>
    <div class="modal-footer">
      <button type="button" class="btn btn-outline-dark" (click)="activeModal.close('Close click')">Cerrar</button>
    </div>
  `
})

export class NgbdModalContent {
  @Input() name;
  @Input() body;
  @Input() ref;

  constructor(public activeModal: NgbActiveModal){}
}

@Component({
  selector: 'app-pago-servicios',
  templateUrl: './pago-servicios.component.html',
  styleUrls: ['./pago-servicios.component.css']
})

export class PagoServiciosComponent{
  @Input() name;
  @Input() body;
  @Input() ref;

  constructor(private modalService: NgbModal) {}
  open1(){
    const modalRef = this.modalService.open(NgbdModalContent);
    modalRef.componentInstance.name = 'Agua';
    modalRef.componentInstance.body = 'EMOS de Rio Cuarto';
    modalRef.componentInstance.ref = 'https://emosvirtual.riocuarto.gov.ar:9090/emosweb/servlet/com.emosweb.login';
  }
  open2(){
    const modalRef = this.modalService.open(NgbdModalContent);
    modalRef.componentInstance.name = 'Gas';
    modalRef.componentInstance.body = 'ECOGAS de Rio Cuarto';
    modalRef.componentInstance.ref = 'https://autogestion.ecogas.com.ar/uiextranet/ingreso?s=p';
  }
  open3(){
    const modalRef = this.modalService.open(NgbdModalContent);
    modalRef.componentInstance.name = 'Luz';
    modalRef.componentInstance.body = 'EPEC de Rio Cuarto';
    modalRef.componentInstance.ref = 'https://www.epec.com.ar/oficina-virtual/mis-pagos';
  }
  open4(){
    const modalRef = this.modalService.open(NgbdModalContent);
    modalRef.componentInstance.name = 'Internet';
    modalRef.componentInstance.body = 'Fibertel de Rio Cuarto';
    modalRef.componentInstance.ref = 'https://www.cablevisionfibertel.com.ar/yopagoencasa';
  }
}
