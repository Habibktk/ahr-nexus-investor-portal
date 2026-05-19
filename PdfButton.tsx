'use client'
import jsPDF from 'jspdf'; import autoTable from 'jspdf-autotable'
export default function PdfButton({title,rows}:{title:string;rows:any[]}){ function download(){ const doc=new jsPDF(); doc.text(title,14,16); autoTable(doc,{startY:24,head:[Object.keys(rows[0]||{Message:'No data'})],body:rows.length?rows.map(r=>Object.values(r)):[['No data']]}); doc.save(`${title.replaceAll(' ','-')}.pdf`) } return <button onClick={download} className="btn">Download PDF Statement</button> }
