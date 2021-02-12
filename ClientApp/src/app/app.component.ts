import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { command } from 'src/app/models/command';
import { map, tap } from 'rxjs/operators'
import { commandPipeTest } from 'src/app/models/commandPipeTest';
import { Router } from '@angular/router';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html'
})
export class AppComponent {

  constructor( private http : HttpClient, private route : Router)
  {
  }

  loginCheck : string = this.route.url;

   test() : boolean {
    if(this.loginCheck == '/')
      return false;
    else
      return true;
  }

  width: number = 0;
  height: string = window.innerHeight + 'px';
  ngOnInit(): void {
    //Called after the constructor, initializing input properties, and the first call to ngOnChanges.
    //Add 'implements OnInit' to the class.
    console.log(this.height);

    console.log(this.loginCheck);
  }
}
