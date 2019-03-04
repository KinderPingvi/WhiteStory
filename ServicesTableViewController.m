//
//  ServicesTableViewController.m
//  WhiteStory 1.1.0
//
//  Created by Anastasiya on 16.11.17.
//  Copyright © 2017 Anastasiya. All rights reserved.
//

#import "ServicesTableViewController.h"
#import "PromoViewController.h"
#import "SWRevealViewController.h"
#import "ServicTableViewCell.h"
@interface ServicesTableViewController ()
@property NSArray* textServic;
@property NSArray* labelServis;
@property NSArray* imgServis;

@property NSArray* textServic2;
@property NSArray* labelServis2;
@property NSArray* imgServis2;

@property NSArray* textServic3;
@property NSArray* labelServis3;
@property NSArray* imgServis3;
@end

@implementation ServicesTableViewController
@synthesize textSection,imgSection;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
   [self.navigationItem.backBarButtonItem setTitle:@""];
    textSection = [NSArray arrayWithObjects:@"Эстетическая стоматология",@"Лечение зубов",@"Протезирование зубов", nil];
    imgSection =[NSArray arrayWithObjects:@"Aesthetic.png",@"Treatment.png",@"Prosthetics.png", nil];
    
    
    _labelServis = [NSArray arrayWithObjects:@"Эстетическая реставрация зубов",@"Ультратонкие виниры",@"Отбеливание зубов Zoom 4",@"Виниры и люминаты",@"Гигиеническая чистка зубов", nil];
    _textServic = [NSArray arrayWithObjects:@"В современное время красивая эстетическая улыбка играет важную роль. Чтобы зубы назвать идеальными, их хорошего здоровья недостаточно, помимо этого они должны быть внешне привлекательными. К сожалению, большая половина населения планеты не может похвастаться красивой улыбкой от природы. В этом случае приходит на помощь эстетическая стоматология, которая сделает улыбку привлекательной. Стоматологическая клиника «WhiteStory» предлагает высококачественную эстетическую стоматологию в Чистых Прудах по приемлемым ценам.\r\n\r\nС какими проблемами помогает справиться эстетическая стоматология.\r\n\r\nЭстетическая стоматология является достаточно новой стоматологической услугой, которая получила своё развитие в США в середине XX века. Сейчас такой вид стоматологии получил широкое развитие почти во всех странах мира. Для современной эстетической стоматологии нет нерешаемых задач. Выделяют 6 основных задач, которые решает эта методика:\r\n\r\nОтбеливание помогает сделать эмаль зубов белой и однотонной. Существует несколько видов отбеливания зубной эмали, поэтому каждый может выбрать наиболее подходящую методику.\r\n Наращивание – устранение незначительных сколов и трещин на твёрдой ткани зуба.\r\nРеставрирование зубов – восстановление естественности цвета эмали и формы резцов.\r\nДекорирование – разные украшения на зубы: кристаллы, драгоценные камни, татуировки.\r\nКоронки – замещение зуба, устанавливаются на специальные мосты.\r\nИсправление прикуса – наиболее длительная процедура, особенно в старшем возрасте. В результате прикус становится ровным и правильным, а улыбка красивой.\r\nВ стоматологической клинике «WhiteStory» эстетическую реставрацию зубов выполнят квалифицированные специалисты, которые имеют индивидуальный подход к каждому клиенту.",@"Установка виниров на передние зубы – отличный вариант скрыть неэстетичный вид резцов. Такая процедура поможет скрыть недостатки полости рта и сделать улыбку красивой. Установка виниров занимает небольшое количество времени при наименьшем препарировании ткани зуба. Существую также пластины, не требующие стачивания ткани резцов. Виниры помогают сделать зубы белыми. После установки материал нельзя отличить от настоящих зубов. Это обусловлено высоким качеством материала, используемого для изготовления микропротезов.",@"В настоящее время всё больше людей стараются сделать свою улыбку неотразимой. Ведь краси-вые здоровые белые зубы – это не только эстетика, но даже элемент культуры современного общества. Отбеливание необходимо людям, зубы которых имеют жёлтый устойчивый цвет. Клиника стоматологии «WhiteStory» предлагает профессиональное отбеливание зубов Zoom 4 по приемлемой цене отличного качества.",@"Установка виниров и люминиров – это замечательный способ придать красивый и эстетичный вид улыбке. Такой вариант служит хорошей альтернативой реставрации и отбеливанию. Стоит отметить, что оба вида служат для коррекции зубов, но не для их лечения. Они представляют собой очень тонкие пластинки высокой прочности, которые крепятся на переднюю часть зуба, тем самым скрывая его недостатки.",@"Профессиональная чистка ротовой полости выполняется стоматологами гигиенистами. Специалисты рекомендуют каждому человеку проводить такую процедуру хотя бы один раз в полгода, так как она помогает избавиться от некоторых причин, вызывающих заболевание зубов. Специалисты стоматологической клиники «WhiteStory» выполнят гигиеническую чистку зубов в Москве на высочайшем уровне.\r\n\r\nЧто способно вызвать заболевания зубов\r\n\r\nОсновной причиной, вызывающей заболевания в ротовой полости, является наличие вредоносных бактерий. Именно под их воздействием происходит разрушение зубов. Эти бактерии оказывают отрицательное влияние не только на эмаль зубов, но и десна.\r\n\r\nУпотребление большого количества сладкого способствует скоплению вредоносных бактерий, которые скапливаются на зубах в виде липкого налёта. Именно этот налёт способствует образованию кариеса.\r\n\r\nСкопившийся на зубах налёт со временем затвердевает и превращается в камень.", nil];
    
    _imgServis = [NSArray arrayWithObjects:@"7.jpg",@"5.jpg",@"otbelivanie.png",@"7.jpg",@"chistka.png" ,nil];
    
    //**************************************************************
    _imgServis2 = [NSArray arrayWithObjects:@"endodont.png",@"chistka.png",@"17.jpg", nil];
    
    _labelServis2 = [NSArray arrayWithObjects:@"Эндодонтическое лечение",@"Лечение зубов",@"Панорамный список", nil];
    _textServic2 = [NSArray arrayWithObjects:@"Лечение канала зуба. Инфекция корневых каналов – явление крайне неприятное, требующее немедленного лечение канала зуба. Эндодонтическое лечение направлено на благополучное разрешение этой проблемы – устранение очага инфекции в зубном канале и его последующее пломбирование. Благодаря таким мерам, удается сохранить зуб, а, значит, спокойствие и хорошее настроение пациента. Ведь эндодонтическое лечение не только возвращает прежнюю функциональность зуба, но и ничуть не влияет на его эстетическую привлекательность.\r\n\r\nВ Москве, в инновационной стоматологической клинике White Story, весь процесс лечения зубных каналов проходит с использованием новейших методов анестезии, что позволяет сделать его абсолютно безболезненным.",@"Лечение зубов в Москве. Современные технологии лечения зубов позволяют навсегда забыть о пугающем гуле бормашины и неприятных ощущениях, с которыми неизбежно сталкивались пациенты в кресле стоматолога еще каких-нибудь 10 лет назад. Сегодня лечение зубов – процесс если и не самый приятный, то уж точно быстрый и безболезненный. А все благодаря инновационным методам в борьбе с кариесом.\r\n\r\nНапример, такой метод лечения зубов, как озоновый, позволяет легко и быстро, без применения бормашины и даже, в отдельных случаях, без пломбы, избавиться от кариозных тканей зуба и укрепить зубную ткань с помощью специального укрепляющего геля. Также быстро и безболезненно действует лазерная терапия. Под воздействием излучения, зараженная ткань зуба легко удаляется, а сам пораженный участок – очищается от вредных микроорганизмов под воздействием того же лазерного излучения.\r\n\r\nДля наиболее впечатлительных пациентов – предусмотрены новейшие виды анестезии для снятия любых неприятных ощущений при стоматологических манипуляциях. В центре Москвы, в стоматологическом центре «White Story», Вам предложат на выбор два вида обезболивания при лечении зубов – анестезию инфильтрационную и анестезию мандибулярную.",@"Панорамный снимок зубов эффективный способ выявления и диагностики проблемных зубов. Заболевания зубов могут дать о себе знать слишком поздно и протекать скрыто. И тогда зубной специалист, чтобы оценить объем работы, прибегает к панорамному снимку зубов. Этот метод показал свою высокую эффективность как при выявлении заболеваний ротовой полости, так и в оценке проведенного лечения.", nil];
    
    //****************************************************************************
    
    _imgServis3 = [NSArray arrayWithObjects:@"endodont.png",@"15.jpg",@"5.jpg",@"16.jpg", nil];

    
    _labelServis3 = [NSArray arrayWithObjects:@"Реставрация зубов",@"Протезирование зубов",@"Виниры и люминаты",@"Ортопедия зубов", nil];
    _textServic3 = [NSArray arrayWithObjects:@"Восстановить зуб «с нуля» и сделать его, при этом, неотличимым от других зубов – современной стоматологии под силу и такое! Процедура «реставрация зубов» разработана специально для тех пациентов, кто заботится не только о здоровье своей улыбки, но и о ее красоте.\r\n\r\nРеставрация зубов в чем-то схожа с протезированием, только проводится она более «облегченным» методом. Всего за одно посещение специалист способен преобразить зубы пациента до неузнаваемости – и все благодаря инновационным технологиям быстрого и безболезненного восстановления зубных тканей.",@"Протезирование зубов серьёзная задача, но мы справимся с ней с легкостью. Потеря зубов – неизменный спутник почтенного возраста, активных видов спорта и просто неважного здоровья ротовой полости. Еще не так давно противостоять этому явлению было нелегко – зубные специалисты предлагали пациентам  лишь неудобные съемные протезы, которые многие не могли носить из-за постоянного дискомфорта, и металлические зубные коронки, с которыми не приходилось говорить об эстетичности и красоте улыбки.",@"Установка виниров и люминиров – это замечательный способ придать красивый и эстетичный вид улыбке. Такой вариант служит хорошей альтернативой реставрации и отбеливанию. Стоит отметить, что оба вида служат для коррекции зубов, но не для их лечения. Они представляют собой очень тонкие пластинки высокой прочности, которые крепятся на переднюю часть зуба, тем самым скрывая его недостатки.",@"Ортопедия зубов решает ситуацию с неудовлетворительным состоянием зубов. Отсутствие одного или нескольких зубов? Желание просто выглядеть красивей и представительней? – Специалисты ортопедической стоматологии без труда решат все эти проблемы. Это настоящие кудесники, изготавливающие и устанавливающие зубные протезы, вкладки, имплантаты, которые ничем не отличаются натуральных зубов.", nil];
    
    NSMutableDictionary *one = [NSMutableDictionary dictionary];
    [one setObject:_labelServis forKey:@"items"];
    [one setObject:[textSection objectAtIndex:0] forKey:@"title"];
    
    NSMutableDictionary *two = [NSMutableDictionary dictionary];
    [two setObject:_labelServis2 forKey:@"items"];
    [two setObject:[textSection objectAtIndex:1] forKey:@"title"];
    
    NSMutableDictionary *three = [NSMutableDictionary dictionary];
    [three setObject:_labelServis3 forKey:@"items"];
    [three setObject:[textSection objectAtIndex:2] forKey:@"title"];
    
    self.allSection = @[one,two,three];
    
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didSelectSection:(UIButton*)sender {
    //Получение текущей секции
    NSMutableDictionary *currentSection = [self.allSection objectAtIndex:sender.tag];
    
    //Получение элементов секции
    NSArray *items = [currentSection objectForKey:@"items"];
    
    //Создание массива индексов
    NSMutableArray *indexPaths = [NSMutableArray array];
    for (int i=0; i<items.count; i++) {
        [indexPaths addObject:[NSIndexPath indexPathForRow:i inSection:sender.tag]];
    }
    
    //Получение состояния секции
    BOOL isOpen = [[currentSection objectForKey:@"isOpen"] boolValue];
    
    //Установка нового состояния
    [currentSection setObject:[NSNumber numberWithBool:!isOpen] forKey:@"isOpen"];
    
    //Анимированное добавление или удаление ячеек секции
    if (isOpen) {
        [self.tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationTop];
    } else {
        [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationTop];
    }
    
    [sender setImage:[UIImage imageNamed:[imgSection objectAtIndex:sender.tag]] forState:UIControlStateNormal];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return _allSection.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSDictionary *currentSection = [self.allSection objectAtIndex:section];
    if ([[currentSection objectForKey:@"isOpen"] boolValue]) {
        NSArray *items = [currentSection objectForKey:@"items"];
        return items.count;
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(30, 0, tableView.bounds.size.width-60, 50)];
    headerView.backgroundColor = [UIColor clearColor];
    
    NSDictionary *currentSection = [self.allSection objectAtIndex:section];
    NSString *sectionTitle = [currentSection objectForKey:@"title"];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(30,0, tableView.bounds.size.width-60, 120);
    button.tag = section;
   // button.backgroundColor = [UIColor brownColor];
    [button setTitle:sectionTitle forState:UIControlStateNormal];
    [button addTarget:self action:@selector(didSelectSection:)
     forControlEvents:UIControlEventTouchUpInside];
    [button setImage:[UIImage imageNamed:[imgSection objectAtIndex:section]] forState:UIControlStateNormal];
    [headerView addSubview:button];
    return headerView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 120;
}

- (IBAction)call:(UIBarButtonItem *)sender {
     [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:+74951145554"]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    ServicTableViewCell *cell = (ServicTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    //Если ячейка не найдена
    if (cell == nil) {
        //Создание ячейки
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        
    }
    cell.width =tableView.bounds.size.width-40;
    cell.x = 15;
    NSDictionary *currentSection = [self.allSection objectAtIndex:indexPath.section];
    NSArray *items = [currentSection objectForKey:@"items"];
    NSString *currentItem = [items objectAtIndex:indexPath.row];
    if([currentSection objectForKey:@"title"] == [textSection objectAtIndex:0])
    {
     cell.nameImage = [_imgServis objectAtIndex:indexPath.row];
     cell.textPromo = [_textServic objectAtIndex:indexPath.row];
     cell.labelText.text = currentItem;
    }
    else if([currentSection objectForKey:@"title"] == [textSection objectAtIndex:1])
    {
        cell.nameImage = [_imgServis2 objectAtIndex:indexPath.row];
        cell.textPromo = [_textServic2 objectAtIndex:indexPath.row];
        cell.labelText.text = currentItem;
    }
    else if([currentSection objectForKey:@"title"] == [textSection objectAtIndex:2])
    {
        cell.nameImage = [_imgServis3 objectAtIndex:indexPath.row];
        cell.textPromo = [_textServic3 objectAtIndex:indexPath.row];
        cell.labelText.text = currentItem;
    }
    
    return cell;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        PromoViewController *controller = (PromoViewController *)[segue destinationViewController];
        ServicTableViewCell *cell = (ServicTableViewCell *)[self.tableView cellForRowAtIndexPath:indexPath];
        NSString * img =cell.nameImage;
        NSString *text =cell.textPromo;
        NSString*label = cell.labelText.text;
        [controller setDetailItem:img textPromo:text textLabel:label];
    }
}

@end
