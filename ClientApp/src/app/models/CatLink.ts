// To parse this data:
//
//   import { Convert } from "./file";
//
//   const catLink = Convert.toCatLink(json);

export class CatLink {
    breeds: any[];
    id:     string;
    url:    string;
    width:  number;
    height: number;
}

// Converts JSON strings to/from your types
export class Convert {
    public static toCatLink(json: string): CatLink[] {
        return JSON.parse(json);
    }

    public static catLinkToJson(value: CatLink[]): string {
        return JSON.stringify(value);
    }
}
