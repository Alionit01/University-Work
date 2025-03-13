
# |Task 2:
def cal_final_grade(assignments,quizzes,exam):
    assignment_weight = 0.40
    quiz_weight = 0.20
    exam_weight = 0.30

    assignments *= assignment_weight
    quizzes *= quiz_weight
    exam *= exam_weight

    final_grade = assignments + quizzes + exam

    return final_grade

print(cal_final_grade(35,25,43))