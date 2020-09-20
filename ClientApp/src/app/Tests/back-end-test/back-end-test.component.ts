import { Component, OnInit } from '@angular/core';
import { commandPipeTest } from 'src/app/models/commandPipeTest';
import { command } from 'src/app/models/command';
import { HttpClient } from '@angular/common/http';
import { map, tap } from 'rxjs/operators';

@Component({
  selector: 'app-back-end-test',
  templateUrl: './back-end-test.component.html',
  styleUrls: ['./back-end-test.component.css']
})
export class BackEndTestComponent implements OnInit {

  constructor( private http : HttpClient)
  {

  }
  
  jsonList : command[]
  jsonPipe : commandPipeTest

  ngOnInit(){
  this.http.get<command[]>('https://localhost:5001/api/commands/')
  .subscribe( ( result : command[] ) => { this.jsonList = result; }, error => { alert(error.message);});

  this.http.get<command>('https://localhost:5001/api/commands/3')
  .pipe(
    map(
      b => <commandPipeTest>{
        id : b.id,
        howTo : b.howTo,
        linePipe : b.line
      }
    ),
    tap(x => console.log(`Command ID: ${x.id} has loaded`))
  )
  .subscribe(
    result => { this.jsonPipe = result}, error => { console.log(error); }
    
  )
}

}
