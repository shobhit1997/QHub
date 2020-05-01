const R= require('ramda');
let query = `(Select id,unit_id,marks,Concat(marks,'-',unit_id,'-',round(rand() * 100)) as rand_rank from (Select id,case`
function getQueryString(sections_data,units_data){
    units=R.pluck("unit_id",units_data);
    marks_questions_map={}
    let query_part3=` else min_marks end as marks,unit_id from questions where unit_id in (${units.join(',')}) order by max_marks) t order by rand_rank ) ranked` 
    let query_part2="";
    sections_data.forEach(ele => {
        if(marks_questions_map[ele.marks_per_question]){
            marks_questions_map[ele.marks_per_question]+=ele.questions_count
        }
        else{
            marks_questions_map[ele.marks_per_question]=ele.questions_count
        }
    });
    Object.keys(marks_questions_map).forEach(e=>{
        query_part2+=` when min_marks <= ${e} and max_marks >= ${e} then ${e}`
    })
    return query+query_part2+query_part3;
}

module.exports={
    getQueryString
}