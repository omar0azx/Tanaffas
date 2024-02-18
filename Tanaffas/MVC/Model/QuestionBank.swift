//
//  QuestionBank.swift
//  Tanaffas
//
//  Created by omar alzhrani on 07/08/1445 AH.
//

import Foundation
import UIKit

class QuestionBank {
    
    var list = [Question]()
    init( ) {
        list.append(Question(text: "هل تشعر بالحزن؟", answer1: "لا أشعر بالحزن.",
                             answer2: "أشعر بالحزن.",
                             answer3: "أشعر بالحزن طوال الوقت، ولا أستطيع أن أتخلص منه.",
                             answer4: "أنني حزين بدرجة لا أستطيع تحملها."))
        
        list.append(Question(text: "هل تشعر بالتشاؤم والإحباط تجاه المستقبل؟" , answer1: "لست متشائماً بالنسبة للمستقبل.",
                             answer2: "أشعر بتشاؤم بالنسبة للمستقبل.",
                             answer3: "أشعر بأنه ليس هناك شيء يشدني للمستقبل.",
                             answer4: "أشعر بأن المستقبل لا أمل فيه وأن الأمور لن تتحسن."))
        
        list.append(Question(text: "هل تشعر بالفشل ؟" , answer1: "لا أشعر بأني فاشل.",
                             answer2: "أشعر أنني فشلت أكثر من المعتاد.",
                             answer3: "عندما انظر إلى ما مضى من سنوات عمري فأنا لا أرى سوى الفشل الذريع.",
                             answer4: "أشعر بأنني شخص فاشل تماماً."))
        
        list.append(Question(text: "هل تستمتع بالأنشطة التي كانت ممتعة بالنسبة لك من قبل ؟", answer1: "استمتع بدرجة كافية بجوانب الحياة كما اعتدت من قبل.",
                             answer2: "لا استمتع بجوانب الحياة على النحو الذي تعودت عليه.",
                             answer3: "لم أعد احصل على استمتاع حقيقي في أي شيء في الحياة.",
                             answer4: "لا استمتع إطلاقاً بأي شيء في الحياة."))
        
        list.append(Question(text: "هل تشعر بالذنب؟", answer1: "لا أشعر بالذنب.",
                             answer2: "أشعر بأني قد أكون مذنباً.",
                             answer3: "أشعر بشعور عميق بالذنب في أغلب الأوقات.",
                             answer4: "أشعر بالذنب بصفة عامة."))
        
        list.append(Question(text: "هل تميل لمعاقبة نفسك ؟", answer1: "لا أشعر بأني أتلقى عقاباً.",
                             answer2: "أشعر بأني قد أتعرض للعقاب.",
                             answer3: "أتوقع أن أعاقب.",
                             answer4: "أشعر بأني أتلقى عقاباً."))
        
        list.append(Question(text: "هل تعاني من لوم الذات ؟", answer1: "لا أشعر بعدم الرضا عن نفسي.",
                             answer2: "أنا غير راضي عن نفسي.",
                             answer3: "أنا ممتعض من نفسي.",
                             answer4: "أكره نفسي."))
        
        list.append(Question(text: "هل ثقتك بنفسك منخفضة ؟", answer1: "لا أشعر بأني أسوأ من الآخرين.",
                             answer2: "أنقد نفسي بسبب ضعفي وأخطائي.",
                             answer3: "ألوم نفسي معظم الوقت على أخطائي.",
                             answer4: "ألوم نفسي على كل شيء سيء يحدث."))
        
        list.append(Question(text: "هل لديك أفكار وميول انتحارية ؟", answer1: "لا أشعر بضيق من الحياة.",
                             answer2: "ليس لي رغبة في الحياة.",
                             answer3: "أصبحت أكره الحياة.",
                             answer4: "أتمنى الموت إذا وجدت فرصة لذلك."))
        
        list.append(Question(text: "هل تعاني من البكاء ؟", answer1: "لا أبكي أكثر من المعتاد.",
                             answer2: "أبكي الآن أكثر من ذي قبل.",
                             answer3: "أبكي طوال الوقت.",
                             answer4: "لقد كنت قادراً على البكاء فيما مضى ولكنني الآن لا أستطيع البكاء حتى لو كانت لي رغبة في ذلك."))
        
        list.append(Question(text: "هل تعاني من فقدان الاهتمام بالآخرين ؟", answer1: "لم أفقد الاهتمام بالناس الآخرين.",
                             answer2: "إني أقل اهتماماً بالآخرين مما اعتدت أن أكون.",
                             answer3: "لقد فقدت معظم اهتمامي بالناس الآخرين.",
                             answer4: "لقد فقدت كل اهتمامي بالناس الآخرين."))
        
        list.append(Question(text: "كم من الوقت تشعر بالانزعاج أو الغضب ؟", answer1: "لست متوتراً أكثر من ذي قبل.",
                             answer2: "أتضايق أو أتوتر بسرعة أكثر من ذي قبل.",
                             answer3: "أشعر بالتوتر كل الوقت.",
                             answer4: "لا أتوتر أبداً من الأشياء التي كانت توترني فيما مضى."))
        
        list.append(Question(text: "هل تعاني من صعوبة في اتخاذ القرارات ؟", answer1: "أتخذ قرارات على نفس المستوى الذي اعتدت عليه.",
                             answer2: "لقد توقفت عن اتخاذ القرارات بصورة أكبر مما مضى.",
                             answer3: "أجد صعوبة أكبر في اتخاذ القرارات عما كنت أقوم به.",
                             answer4: "لم أعد أستطيع اتخاذ القرارات على الإطلاق."))
        
        list.append(Question(text: "هل شعورك تجاه ذاتك سلبي؟", answer1: "لا أشعر أني أبدو في حالة أسوأ عما اعتدت أن أكون.",
                             answer2: "يقلقني أن أبدو أكبر سناً واقل حيوية.",
                             answer3: "أشعر بأن هناك تغيرات مستديمة في مظهري تجعلني أبدو أقل حيوية.",
                             answer4: "أعتقد أني أبدو قبيحاً."))
        
        list.append(Question(text: "هل تعاني من صعوبة في أداء المهام ؟", answer1: "أستطيع أن أقوم بعملي كما تعودت.",
                             answer2: "أحتاج لجهد كبير لكي أبدأ في عمل شيء ما.",
                             answer3: "إن علي أن اضغط على نفسي بشدة لعمل أي شيء.",
                             answer4: "لا أستطيع أن أقوم بعمل أي شيء على الإطلاق."))
        
        list.append(Question(text: "هل تعاني من الأرق ومشاكل النوم ؟", answer1: "أستطيع أن أنام كالمعتاد.",
                             answer2: "لا أنام كالمعتاد.",
                             answer3: "استيقظ قبل موعدي بساعة أو ساعتين وأجد صعوبة في النوم مرة أخرى.",
                             answer4: "استيقظ قبل بضعة ساعات من موعدي المعتاد ولا أستطيع العودة للنوم مرة أخرى."))
        
        list.append(Question(text: "كم من الوقت تشعر بالتعب ؟", answer1: "لا أشعر بتعب أكثر من المعتاد.",
                             answer2: "أتعب بسرعة عن المعتاد.",
                             answer3: "أتعب من القيام بأي جهد في عمل أي شيء.",
                             answer4: "إني أتعب لدرجة أنني لا أستطيع أن أقوم بأي عمل."))
        
        list.append(Question(text: "هل لديك اضطراب في الشهية مثل زيادة الشهية أو نقص الشهية؟", answer1: "إن شهيتي للطعام ليست أقل من المعتاد.",
                             answer2: "إن شهيتي للطعام ليست جيدة كالمعتاد.",
                             answer3: "إن شهيتي للطعام أسوأ كثيراً الآن.",
                             answer4: "ليس لدي شهية على الإطلاق في الوقت الحاضر."))
        
        list.append(Question(text: "هل تعاني من فقدان الوزن أو السمنة وزيادة الوزن ؟", answer1: "لم ينقص وزني في الآونة الأخيرة.",
                             answer2: "فقدت أكثر من كيلو جرامات من وزني.",
                             answer3: "فقدت أربعة كيلو جرامات من وزني.",
                             answer4: "فقدت ستة كيلو جرامات من وزني."))
        
        list.append(Question(text: "هل تعاني من آلام لا تزول باستخدام المسكنات مثل الصداع وآلام الظهر والرقبة وتشنجات جهاز الهضم ؟", answer1: "لست مشغولاً على صحتي أكثر من السابق.",
                             answer2: "أني مشغول جداً ببعض المشكلات البدنية مثل الأوجاع واضطرابات المعدة والإمساك.",
                             answer3: "أني مشغول جداً ببعض المشكلات اليومية ومن العصب أن أفكر في أي شيء آخر.",
                             answer4: "أني مشغول جداً ببعض المشكلات البدنية أني لا أستطيع أن أفكر في أي شيء آخر."))

        list.append(Question(text: "هل لديك قلة في الرغبة الجنسية ؟", answer1: "لم ألاحظ أي تغيرات حديثة في اهتمامي الجنسية.",
                             answer2: "أنني أقل اهتماماً بالجنس عن المعتاد.",
                             answer3: "لقد قل الآن اهتمامي بالجنس كثيراً.",
                             answer4: "لقد فقدت اهتمامي بالجنس تماماً."))
    }
}