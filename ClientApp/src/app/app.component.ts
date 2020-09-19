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

 
  redBoxx = "col-3 d-flex text-center align-items-center redBox";
  blackBoxx = "TestArea col-9 d-flex justify-content-center align-items-center";
  title = "row d-flex align-items-center justify-content-center text-info";

  /*
    Test Area
  */
  //TestPanel Data
  // testPanelArray = ["yes", "this", "component", "works"];
  
  //CustomButton
  buttonText = "Test Button";

  // Test End

  constructor( private http : HttpClient)
  {
  }

}
