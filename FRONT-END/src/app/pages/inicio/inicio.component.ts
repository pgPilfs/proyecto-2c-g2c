import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';


@Component({
  selector: 'app-inicio',
  templateUrl: './inicio.component.html',
  styleUrls: ['./inicio.component.css']
})
export class InicioComponent implements OnInit {

  public isCollapsed = true;
  public blnDisplayMenu = true;

  toggleMenu(res?: string) {
    this.isCollapsed = !this.isCollapsed;
    if(res){
      // this.login.logout();
    }
  }

  constructor(private router: Router) { 
    // router.events.pipe(
    //   filter((event: any) => event instanceof NavigationEnd)
    // )
    // .subscribe(event => {
    //   if(event.url === "/login" ){
    //     this.blnDisplayMenu = false;
    //   }else{
    //     this.blnDisplayMenu = true;    
    //   }
    // });
  }
  ngOnInit(): void {
  }

}
