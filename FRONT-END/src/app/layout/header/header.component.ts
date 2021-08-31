import { Component, OnInit} from '@angular/core';
import { NavigationEnd, Router } from '@angular/router';
import {filter} from 'rxjs/operators';

@Component({
  selector: 'adm-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {

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
