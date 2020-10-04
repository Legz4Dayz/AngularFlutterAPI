import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { command } from 'src/app/models/command';
import { map, tap } from 'rxjs/operators'
import { commandPipeTest } from 'src/app/models/commandPipeTest';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html'
})
export class AppComponent {

  constructor( private http : HttpClient)
  {
  }

  width: number = 0;
  height: string = window.innerHeight + 'px';
  ngOnInit(): void {
    //Called after the constructor, initializing input properties, and the first call to ngOnChanges.
    //Add 'implements OnInit' to the class.
    console.log(this.height);
  }
}
