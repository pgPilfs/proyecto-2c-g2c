import { Component, OnInit} from '@angular/core';
import { AuthService } from '../../service/auth/auth.service';
const EMAIL = 'Email'

@Component({
  selector: 'adm-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {

  public isCollapsed = true;
  public expression:boolean = false;
  public email: string;

  toggleMenu() {
    this.isCollapsed = !this.isCollapsed;
  }

  constructor(private authService: AuthService) {}

  ngOnInit(): void {
    this.authService.estaAutenticado.subscribe((res)=>{
      console.log(res);
      if(res == true){
        this.email = localStorage.getItem(EMAIL);
        console.log(this.email);
        this.expression = true;
      }
    })
  }

  salir(){
    this.expression = false;
    this.authService.logOut();
  }



}
