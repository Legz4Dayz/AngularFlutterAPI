import { Component, OnInit, Input } from '@angular/core';

@Component({
  selector: 'test-panel',
  templateUrl: './test-panel.component.html',
  styleUrls: ['./test-panel.component.css']
})
export class TestPanelComponent implements OnInit {
  @Input() test : string[];
  // @Input() title? : string
  // @Input() subtitle? : string

  //ex: [input] = "parentArray" 
  //^ binds the parents "parentArray" value to this components
  //input array
  
  routeHome(){
    Navigator.name
  }
  
  redBoxx = "col-3 d-flex text-center align-items-center redBox";
  blackBoxx = "TestArea col-9 d-flex justify-content-center align-items-center";
  title = "row d-flex align-items-center justify-content-around text-info";

  /*
    Test Area
  */
  //TestPanel Data
  // testPanelArray = ["yes", "this", "component", "works"];
  
  //CustomButton
  buttonText = "Test Button";

  // Test End


  constructor() { }

  ngOnInit(): void {
  }

}
