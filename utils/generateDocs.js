require('isomorphic-fetch');
const createReport = require('docx-templates').default;
const fs = require('fs')
const path = require('path')

async function generateAssignment(assignment){
    
    const template = fs.readFileSync(path.resolve(__dirname, '../assignmentTemplates/assignment_template.docx'));
    var buffer=await createReport({
        template,
        data: assignment,
        additionalJsContext: {
          getImage: async (url, size = 5) => {
            const resp = await fetch(url
            );
            const buffer = resp.arrayBuffer
              ? await resp.arrayBuffer()
              : await resp.buffer();
            return { width: size, height: size, data: buffer, extension: '.png' };
          }
          }
      })
      
    fs.writeFileSync(path.resolve(__dirname, `../outputAssignments/${assignment.subject_name}_Assignment ${assignment.assignment_no}.docx`), buffer)
}

async function generateQuestionPaper(question_paper){
    
  const template = fs.readFileSync(path.resolve(__dirname, '../questionPaperTemplates/question_paper_template.docx'));
  var buffer=await createReport({
      template,
      data: question_paper,
      additionalJsContext: {
        getImage: async (url, size = 5) => {
          console.log(url);
          const resp = await fetch(url
          );
          const buffer = resp.arrayBuffer
            ? await resp.arrayBuffer()
            : await resp.buffer();
          return { width: size, height: size, data: buffer, extension: '.png' };
        },
        isOptional(type){
          return type==='optional';
        },
        isCompulsary(type){
          return type==='compulsary';
        }
      }
  })
    
  fs.writeFileSync(path.resolve(__dirname, `../outputQuestionPapers/${question_paper.subject_name}_Exam ${question_paper.exam}.docx`), buffer)
}
module.exports={
    generateAssignment,
    generateQuestionPaper
}

 
