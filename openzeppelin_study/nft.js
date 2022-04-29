import { NFTStorage, File } from "nft.storage";
import fs from "fs";

const apiKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkaWQ6ZXRocjoweGYzNTMwQ2U4ZUY0Mjg3MUNBNmU0QTNhNjRDMWRFNWJiQzQ4RmM3NjkiLCJpc3MiOiJuZnQtc3RvcmFnZSIsImlhdCI6MTY1MTEzODM4NTEzMiwibmFtZSI6Ik15TkZUIn0.h_ULL1udwcd1lghbsEellhwRHYt39-OBnjAfO6tnbVo";
const client = new NFTStorage(
    {
        token : apiKey
    });

const metadata = await client.store({
    name: "gukka",
    description: "gukka hate study",
    image: new File([fs.readFileSync("./gukka.jpeg")], "gukka.jpeg", {
        type: "image/jpeg",
    }),
    attributes: [
        {trait_type: "skin", value: "flash"},
        {
            trait_type: "face",
            value: "frightened",
        },
    ],
});
console.log(metadata.url);
// ipfs://bafyreibe7diueyorlvb6wyiiui2urrwz3fk3o2xdcym7ssmdnefrukilly/metadata.json
