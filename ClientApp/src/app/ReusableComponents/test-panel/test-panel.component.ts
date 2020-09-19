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
  
  constructor() { }

  ngOnInit(): void {
  }

}
