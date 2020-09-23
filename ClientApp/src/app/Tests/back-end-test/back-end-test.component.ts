import { Component, OnInit } from '@angular/core';
import { commandPipeTest } from 'src/app/models/commandPipeTest';
import { command } from 'src/app/models/command';
import { HttpClient } from '@angular/common/http';
import { map, shareReplay, tap } from 'rxjs/operators';
import { BackEndService } from './back-end-service.service';

@Component({
  selector: 'app-back-end-test',
  templateUrl: './back-end-test.component.html',
  styleUrls: ['./back-end-test.component.css']
})
export class BackEndTestComponent implements OnInit {

  constructor( private http : HttpClient, private backend :BackEndService)
  {}
  
  jsonList : command[]
  jsonPipe : commandPipeTest

  commandSingle$ = this.backend.singleCommand$;

  commandList$ = this.backend.commandList$.pipe( shareReplay(1) );
  
  ngOnInit(){}
}
