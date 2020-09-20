import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { command } from 'src/app/models/command';
import { map, tap } from 'rxjs/operators'
import { commandPipeTest } from 'src/app/models/commandPipeTest';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {

 
  constructor( private http : HttpClient)
  {
  }

}
