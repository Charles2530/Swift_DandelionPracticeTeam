//
//  CountyFeaturesView.swift
//  DandelionPracticeTeam
//
//  Created by Charles on 2023/9/29.
//

import SwiftUI
let buttons1 = [
    ButtonData(title: "地理位置", imageBinding: "ZhongYangFromSky", descriptionBinding: "中阳县位于吕梁山脉中段西麓，面积1441.4平方公里，常住人口在2021年末为136925人。中阳县气候属暖温带亚干旱区大陆性季风气候。截至2021年10月，中阳县辖5个镇、1个乡。"),
    ButtonData(title: "风景名胜", imageBinding: "ZhongYangFromSky", descriptionBinding: "由于地处山脉，中阳县境内有许多自然风光与人造景观。县城东5公里处有柏洼山，海拔1250米，集柏海松林、道教信仰、湖泊溶洞于一体，山中有龙泉关，至少有近千年历史，内存大量道教遗迹。"),
    ButtonData(title: "革命老区", imageBinding: "ZhongYangFromSky", descriptionBinding: "中阳县作为革命老区，是山西省第一个县级苏维埃政权所在地，革命思想在中阳的传播可以追溯至新民主主义革命时期。聂荣臻等曾在中阳境内进行关上战斗大败阎锡山，抗日时期中阳县牺牲救国同盟会也发挥了重大作用。")
]
let buttons2 = [
    ButtonData(title: "中阳黑木耳", imageBinding: "HeiMuEr", descriptionBinding: "作为中阳木耳产业的新兴龙头企业，心言生物科技有限公司在政府的强力支持下，最新建设的木耳生产线已于去年投产，该公司同时经营一-亿年产量的菌棒生产以及1000栋规模的大棚种植，利用自动化的生产设备实现高效生产，同时着眼于全产业链的木耳深加工并注重鱼菜共生的水资源循环利用。希望中阳的木耳产业在政府的扶持下，在心言公司的带领下继续茁壮成长，快速发展。"),
    ButtonData(title: "中钢", imageBinding: "ZhongGang", descriptionBinding: "山西中阳钢铁有限公司，坐落于中阳县城北部，始建于1985年，如今已发展成为中阳的第一大企业年产值150亿元，拥有职工上万名，集采煤、选煤、采矿、选矿、炼铁、炼钢、轧钢、发电于一体，具有庞大的产业规模，广区内食堂、桥舍等生活设施也一应俱全，具有明显的20世纪大型企业的社会化特征，突出体现了以人为本的企业特色。近年来，中钢与北航进行深度技术合作，研究出了以Q195为代表的一系列高技术钢铁产品。"),
    ButtonData(title: "醋", imageBinding: "Cu", descriptionBinding: "柏洼古井手工醋庄坐落于泊洼山脚下，董事长王先生传承家族的古法手艺，在酿醋领域已经深耕了三十多年，通过使用小麦、柏叶松针等不同的原料，开发了松针酷、柏叶醋高粱醋等高端保健醋、养生醋等不同的商品类型，带领柏洼手工醋走上多元化、高端化、高附加值的发展道路。"),
    ButtonData(title: "孵化园", imageBinding: "FuHuaYuan", descriptionBinding: "吕梁市北航中汇科技孵化器，为北航与当地政府合作召集、培养新兴产业的基地，内含硕为思集团、华艺民俗文化发展有限公司、山西辰宇服装有限公司等新兴产业公司，分别代表了在传统重工业以外的网络技术、传统文化、轻工业，为中阳县的多元化发展与产业转型提供了道路指引，为这个曾经的贫困县带来了发展潜力与生产活力。")
]
let buttons3=[
    ButtonData(title: "非遗文化", imageBinding: "FeiYiWenHua", descriptionBinding: "作为中阳非遗文化的代表，中阳剪纸与当地传统民俗文化血肉相连。它以中阳当地民俗信仰。发时节令、人生礼仪、神话传说为主要表现内容，多以红纸剪成，体现着喜庆、热烈的民俗气氛。中阳剪纸作为第一批国家级非遗以及世界遗产，近年来受到政府广泛量”视，以传承人武小汾为代表的的中阳剪纸正在蓬勃发展并带动当地就业。中阳县的非遗项目还有中阳刺绣、九曲灯会、中阳弹唱等。"),
    ButtonData(title: "窑洞", imageBinding: "YaoDong", descriptionBinding: "在阳坡村，仍然可以见到存在已久的士窑洞。窑洞是山西省的传统民居之一，一般修在朝南的山坡上向阳，背靠山，面朝开阔地带，少有树木遮挡，十分适宜居住生活。窑洞沉积了古老的黄士地深层文化，广大人民在劳动中创造了窑洞艺术，小小窑洞浓缩了黄上地的别样风情。在旧窑洞的不远处便是新建的现代化建筑，值得提的是、即使是现代化的建筑，依然是傍山而建，门窗拱形。可以说，窑洞在当地人民的心里有着举足轻重的地位。"),
    ButtonData(title: "移风易俗", imageBinding: "YiFengYiSu", descriptionBinding: "无论是县城还是村镇，总能见到这样的标语“婚事新办丧事简办、余事不办”。近年来中阳政府在持续巩固提升脱贫攻坚成果的后将乡村振兴与文明建设进行有效衔接，大力宣传婚事新办、丧时，事简办、余事不办的良好社会风气，全面促进移风易俗工作制度规范化、常态化，乡村社会文明程度不断提升，摒弃陈规陋共建文明风尚的氛围日益浓厚。"),
    ButtonData(title: "美食", imageBinding: "MeiShi", descriptionBinding: "中阳县城的大街小巷，充满了各种经营当地美食的饭馆。柏籽羊肉是山西省的名特产品之一，肉质密实，油色洁白，味含柏香，不腥不腻，因放养山林食柏籽、喝柏水而得名，产区局限在中阳侧柏山区范围内。麻豆腐是中阳县的另一道传统美食，是用豆腐皮包裹猪肉馅和各种蔬菜，再用麻油和辣椒油炸而成，口感酥脆，味道独特。夜面为当地面试的一大代表，泛指用筱面制成的各种面食，有面条状、卷筒状、短条状等多种吃法，各有风味。")
]
let buttons4=[
    ButtonData(title: "筚路蓝缕，革命底色阅读", imageBinding: "HeiMuEr", descriptionBinding: "作为中阳木耳产业的新兴龙头企业，心言生物科技有限公司在政府的强力支持下，最新建设的木耳生产线已于去年投产，该公司同时经营一亿年产量的菌棒生产以及1000栋规模的大棚种植，利用自动化的生产设备实现高效生产，同时着眼于全产业链的木耳深加工并注重鱼菜共生的水资源循环利用。希望中阳的木耳产业在政府的扶持下，在心言公司的带领下继续苗壮成长，快速发展。"),
    ButtonData(title: "稳步发展，生产复苏阅读", imageBinding: "ZhongGang", descriptionBinding: "山西中阳钢铁有限公司，坐落于中阳县城北部，始建于1985年，如今已发展成为中阳的第一大企业，年产值150亿元，拥有职工上万名，集采煤、选煤、采矿、选矿、炼铁、炼钢、轧钢、发电于一体，具有庞大的产业规模。厂区内食堂、商店、宿舍等生活设施也一应俱全，具有明显的20世纪大型企业的社会化特征，突出体现了以人为本的企业特色。近年来，中钢与北航进行深度技术合作，研究出了以Q195为代表的一系列高技术钢铁产品。"),
    ButtonData(title: "乡村振兴，全面脱贫", imageBinding: "Cu", descriptionBinding: "柏洼古井手工醋庄坐落于泊洼山脚下，董事长王先生传承家族的古法手艺，在酿醋领域已经深耕了三十多年，通过使用小麦、柏叶、松针等不同的原料，开发了松针醋、柏叶醋、高梁酷等高端保健醋、养生醋等不同的商品类型，带领柏洼手工醋走上多元化、高端化、高附加值的发展道路。"),
]

let sectionsData1 = [
    SectionData(id: 0, buttonSet: buttons1 ),
]
let sectionsData2 = [
    SectionData(id: 1, buttonSet: buttons2 ),
]
let sectionsData3 = [
    SectionData(id: 2, buttonSet: buttons3 ),
]
let sectionsData4 = [
    SectionData(id: 3, buttonSet: buttons4 ),
]

struct CountyFeaturesView:View{
    let pagesData = [
        PageData(id: 0, imageName: "ZhongYangFromSky", description: "中阳县",sectionData: sectionsData1),
        PageData(id: 1, imageName: "HeiMuEr", description: "产业",sectionData: sectionsData2),
        PageData(id: 2, imageName: "HeiMuEr", description: "文化",sectionData: sectionsData3),
        PageData(id: 3, imageName: "HeiMuEr", description: "历史印记",sectionData: sectionsData4)
    ]
    
    var body:some View{
        TabView {
            ForEach(pagesData) { page in
                PageViewContentView(page: page)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}
