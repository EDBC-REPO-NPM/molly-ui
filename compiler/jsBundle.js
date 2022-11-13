const fs = require('fs');

const bundle = new Array();
const cssFiles = fs.readdirSync(`${process.cwd()}/bundle/js`)
    .sort( (A,B)=>{
        const a = Number(A.match(/^\d+/));
        const b = Number(B.match(/^\d+/));
        return a-b;
    });

cssFiles.map((file)=>{
    const data = fs.readFileSync(`${process.cwd()}/bundle/js/${file}`);
    bundle.push(data);
});

process.stdout.write(
    bundle.join('\n')
);