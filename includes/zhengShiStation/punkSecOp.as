//Punk SecOp Core Idea
//Kaithrit, comes in female in male flavors. Shares several scenes with a few unique based on gender.
//Girl has big knockers. Boi has A or B cups.
//Wear’s <i>“augment weave armor”</i> that looks sorta like the crysis suit without a helmet
//Ideal for interfacing with tech. Can be remote-opened by a hack or the SecOp’s radio implant.
//Cybernetic implants have distinct seams
//
//Personality/Interaction Flow:
//Generally orderly and business-like. The pirate equivalent of cops.
//Notes the the PC isn’t supposed to be here (unless the PC has a jumper suit & bun ears or a rat armor and mouse ears).
//PC is escorted back to the elevator
//If PC resists, PC is subdued and dragged back to the elevator.
//Has a pair of <i>“Slut Goggles”</i> for restraining defeated foes. Uses electromagnetic fields to hyperstimulate the pleasure centers of the brain while suppressing the parts responsible for discerning between fantasy/reality. At the same time, they play high-def VR porn.
//Allows for lewd loss scenes from enemies who might not be turned on.
//Allows for more variety in loss scenes, ala Mindwash Visor.
//Still have the option of doing normal loss scenes instead, maybe gated behind turning on the enemy?
//If PC is goggled, comes to in the elevator, maybe randomly covered in fluids.
//
//Cybernetic Mods:
//Finger/Foot paw-pads replaced with rubberized grip assists
//Holovisor projected over eyes for targeting assist. Projectors built into sides of head.
//Antenna implant in right ear for always-on comms
//Sphynx-grade artificial tendons for hyper-pounce jumping. (12’ vertical leaps!)
//Male: 13”</i> robocock with rapid-brewing cum-tanks and throb-o-matic pulsator. (Latex/Rubbery in appearance.)
//Female: Artificial cunt with patented cock-control™ technology and optional expando-clit upgrade. Still soft and squishy but with a visible seam where it meets the organic parts of her. Sort of like this.
//Aphrodisiac lactating cybernips?
//Tongue is long and has a subdermal muscle augmentation that makes it very strong and very coordinated. Can curl into a helix and press out on every part of the PUSS.
//
//Combat Abilities & AI:
//Grins before attacking if the PC uses a stealth field. Sees right through it courtesy of the visor. (Effectively dispels the status)
//Summons a Slamwulf drone (1x/fight). Basic kinetic attack drone.
//HoT shield restore (33 energy)
//Volley (20) energy)
//(1x fight: smuggled stims for energy restore)
//If disarmed: punch!
//Once above 50 lust:
//Puts on gasmask and tosses aphrogas grenade (Lust over time - think I can reuse the status from myrellion)
//Fuck_Boy_Protocols.exe - Slamwulf teeth retract swap with aphrodisiac injectors.
//Bouncing Tease - Leap onto PC’s shoulders and open suit, rubbing junk in face. +Tease! Suit seals back up after.
//Weapon Hack - disable energy weapons

public function showPunkSecOp(nude:Boolean = false):void
{
	if(enemy == null || enemy.hasCock()) showBust("PUNK_SECOP_MALE" + (nude ? "_NUDE":""));
	else showBust("PUNK SECOP_FEMALE" + (nude ? "_NUDE":""));
	showName("PUNK\nSECOP");
}

//Encounter Texts:
public function encounterPunkSecOp():Boolean
{
	showPunkSecOp();
	var tEnemy:Creature = new CyberPunkSecOp();
	setEnemy(tEnemy);
	//First time male
	if(tEnemy.hasCock() && flags["MET_SECOP_MALE"] == undefined)
	{
		output("\n\n<i>“Hey, you aren’t supposed to be here!”</i>");
		output("\n\nA swaggering kaithrit in a suit that looks like it’s made from coiled steel is advancing with long, bounding leaps. The bright blue holovisor across his eyes flickers, painting a red outline around the shape of your body.");
		output("\n\nHe’s too sure of himself to bluff and too fast to hide from. You’ll have to fight!");
	}
	//Female
	else
	{
		output("\n\n<i>“Oh come on! Another one?”</i> A bosomy kaithrit in a suit that looks like it’s made from coiled steel is advancing with a slow shake of her head. <i>“Independents aren’t allowed up here without a boss’s okay and you, cutie, do </i>not<i> have a boss’s okay.”</i> The pale blue band of her cybernetically-projected holovisor lights up with an outline of your body as she finishes some kind of scan. <i>“Come on. If you walk back to the elevator on your own, " + pc.mf("you won’t have to tell everyone you got your ass whupped by a girl.","I won’t have to leave any bruises on that pretty face of yours.") + "”</i>");
		output("\n\nYou’ve been given a choice - be escorted away or fight for the freedom to continue your exploration.");
	}
	CombatManager.newGroundCombat();
	CombatManager.setHostileActors(tEnemy);	
	CombatManager.setFriendlyActors(pc);
	CombatManager.victoryScene(defeatASecop);
	CombatManager.lossScene(loseToPunkSecOP);
	CombatManager.displayLocation("PUNK SECOP");
	clearMenu();
	addButton(0,"Next",CombatManager.beginCombat);
	return true;
}

//Loss Visor Intro (Generic)
//For use with all visor intros unless ya’ll wanna get fancy.
public function loseToPunkSecOP():void 
{
	//showPunkSecOp();
	output("The grinning cyber-kitty strides over your slumping form" + (pc.lust() >= pc.lustMax() ? ", not even so much as bothering to glance at your exposed genitalia or the libertine attentions your hands are determined to give out.":", barely looking down") + ". <i>“Not giving me any trouble now, are you?”</i> [enemy.HeShe] reaches behind [enemy.hisHer] back, producing a pair of blinking goggles with a simple, elastic strap. <i>“Yeah, I think you’re done fighting, but just to be safe, you can take a ride in the goggles while I get you out of the restricted zone.”</i>");
	output("\n\nThe last thing you see before the goggles’ inner blackness envelops your vision is a white-fanged, cheshire grin.");
	output("\n\n<i>“Hold still.”</i>");
	output("\n\nThere is a click, and a snap of static blasts your retinas. You mentally recoil as a high-pitched whine slaps your eardrums, growing ever louder and more disorienting. Dizzy, you vaguely feel your mouth fall open as your mind decouples with your body.");
	output("\n\nYou are the static. The whine is gone. Gentle, soothing fuzz is everything and nothing.");
	//Might swap the below for certain scenes that are less immersive and more programmy
	if(9999 == 9999)
	{
		output("\n\nWhen the visor’s perfectly-rendered, three dimensional programming resolves into clarity, you’re right there with it - a little foggy-minded perhaps. You aren’t sure how you got here, how you came to be in this scenario, but <i>it is too real to reject as anything but your true and natural life</i>.");
		processTime(1);
		clearMenu();
		if(rand(2) == 0) addButton(0,"Next",slutSlutLossScene);
		else addButton(0,"Next",wallSlutPunkSecOpEnd);
	}
	//More mindfucky variant:
	else
	{
		output("\n\nWhen the visor’s perfectly-rendered, three dimensional programming resolves into clarity, it does so with absolute authority. Your attention is dominated utterly by the imagery and audio presented to you. The raw <i>resolution</i> beaming into your brain feels like it occupies the entire front half of your brain. Meanwhile, the back half is buzzing with a vague sense of pleasure... and arousal.");
		processTime(1);
		clearMenu();
		//addButton(0,"Next",);
	}
}

//Wall Slut
public function wallSlutPunkSecOpEnd():void
{
	clearOutput();
	showName("WALL\nSLUT");
	author("Fenoxo");
	output("A low bass thrum ripples through the wall into which you’ve been embedded, though not uncomfortably. There’s a sort of inflatable, rubberized padding lining the socket around your low chest, stretching all the way to your waist. Your [pc.legOrLegs] dangle" + (pc.legCount == 1 ? "s":"") + " uselessly out the other side, not quite able to touch the ground" + (pc.tallness > 6*12+6 ? " in spite of your endless inches of height":"") + ". Worse is that your arms are similarly restrained, leaving you to rely on a band under your armpits to hold you up.");
	output("\n\n" + (pc.lust() < 70 ? "What you see does not inspire your confidence.":"What you see absolutely thrills your lust-addled brain.") + " Neon lights bathe a crowd of debauched laquines in unnatural pinks and blues as they writhe and twist about on a dancefloor, naked or next to it, casually swapping spit and bodily fluids like the obscene sluts they are. Around the pit of sweaty, grinding bunnies are walls like the one in which you now find yourself. Each one has at least three or four slack-jawed servants languishing in the same sort of bondage as you, already painted with two or three layers of thick laquine seed and begging for more.");
	//Not aroused yet
	if(pc.lust() < 40) output("\n\nA sense of pervasive warmth alerts you to something you’d rather not admit - that there’s something hot about all this. Maybe it’s the sights all around you and the way a grinning fuck-bunny strides up to the kaithrit to your left and just thrusts into her waiting, willing maw like she’s nothing more than a piece of extremely fuckable meat. Maybe it’s the sex-saturated air tickling your nose with the musky odor of raw, ready herm-cocks and eager cunts. Maybe you just <i>like being held naked in a wall and presented for public use</i>.");
	//Already Aroused
	else output("\n\nYou flush with pervasive warmth, even beyond what the muggy, fuck-scented air would warrant. This entire scenario is just so unbelievably hot! You watch a grinning fuck-bunny stride up to the kaithrit to your left and thrust a full seventeen inches of equine-shaped dick into the kitty’s accepting maw. The herm doesn’t seem to care one whit for her cock-sucker’s comfort, treating her like the little more than a disposable holster for her mammoth meat. A twinge of jealousy runs through you while you watch. <i>Why didn’t she pick you?</i>");
	//Merge
	output("\n\nA heavy hand slaps your ass, jerking you out of your reverie. You wiggle your ass back into it before you’ve even processed what’s going on, but when a muffled shout of, <i>“nice”</i> reaches you through the wall, you can’t help but blush from head to buttcheek.");
	output("\n\nSo there’s people on the other side of the wall as well!");
	if(pc.hasCock())
	{
		output(" There’s no way you could hide the rigidity of your [pc.cocks] or the strings of pre that dangle from your [pc.cockHeads].");
		if(pc.biggestCockLength() >= 26) output(" Hung as you are, you’re giving everyone a front row seat to your own personal hyper-endowed bondage show.");
	}
	if(pc.hasVagina())
	{
		output(" You wonder how many eyes are staring at your [pc.vaginas] right now. Can they see ");
		if(pc.wettestVaginalWetness() < 3) output("how wet you’ve gotten");
		else if(pc.wettestVaginalWetness() < 4) output("the shine of your excessive lubrication");
		else if(pc.wettestVaginalWetness() < 5) output("the rivers of lubrication streaming down your [pc.thighs]");
		else output("the webs of lubrication cascading down your [pc.legOrLegs], advertising what an absolutely sodden slut you’ve turned yourself into");
		output("?");
	}
	output(" Maybe it’s your [pc.asshole] that’s getting the attention. You couldn’t stop someone from prying your [pc.butts] apart for a better view, let alone thrusting inside... <i>You hope whoever is back there likes what they see.</i>");
	output("\n\nObviously the mystery man on the other side approves. The squeeze he gave your shudderingly pleased heiny was nothing less than absolutely appreciative.");

	//Not turned on fully.
	if(pc.lust() < pc.lustMax()) output("\n\nMaybe this isn’t so bad. Maybe you can have some fun while you’re stuck here. Maybe... it’d be kind of fun to let one of those libidinous laquines fuck a few loads into your belly. You lick your lips.");
	//Turned on fully.
	output("\n\nImmobilization aside, this is pretty awesome. You’re sure that you’re going to have a pretty good time while you wait here. Maybe even suck a few ball-draining loads straight into your belly.");
	//Merge.
	output("\n\nLooking over at the girl to your left, you note that her straining, cum-smeared lips quirk and quiver in between thrusts, so obviously pleased to have such heavy spheres slapping into her chin. When she blinks and recovers enough to take in her surroundings, she gurgles with pleasure and stares straight into the laquine’s sheath imploringly, all but begging it to crinkle around her mouth and stay there, embedded to the hilt. She shudders, nipples hard, and her eyes roll back once more - just in time for another thrust.");
	output("\n\nDid she orgasm from getting face-fucked?");
	output("\n\nWill you?");
	processTime(30);
	pc.lust(50);
	clearMenu();
	addButton(0,"Next",wallSlutLossPart2);
}
public function wallSlutLossPart2():void
{
	clearOutput();
	showName("WALL\nSLUT");
	author("Fenoxo");
	output("Two giggling laquines halt their impassioned gyrations long enough to see you, and after a moment’s discussion, stride your way with heavy hips swinging. It would seem you’re going to find out what a real face-fucking is like sooner rather than later - twice over. One of the bunnies is already stripping down, peeling out of glossy, pre-soaked garments with an eager grin writ upon her gray-furred muzzle. A heavy, eighteen inch slab of gleaming black horse-meat flops between her legs, weighing heavily on her a pair of sack-straining, apple-sized balls.");
	output("\n\nHer partner is smaller but far more done up. Her pink fur all but glows under the flashing neon lights, complimented by luminescent purple mascara and lip gloss so shiny that you can see your reflection in it. She doesn’t bother stripping out of her fishnet shirt or package-defining, shrink-wrapped shorts, though the latter garment has gained a few gaps along the seam that appear to grow larger with every stitch-destroying throb of her bound dick. Pink winks at you and reaches between Gray’s legs to heft her balls for your inspection.");
	//Bimbo
	if(pc.isBimbo()) output("\n\nOh fuck yes! You don’t care that you’re drooling or that you that your mouth is already open wide. You thrust your tongue invitingly and look up with your best <i>“fuck my useless cum-dump of a mouth”</i> eyes. This is going to be so fun!");
	//Cum Addict?
	else if(pc.isDependant(2)) output("\n\nOh fuck yes! You can scarcely believe your luck. You’re always down to take a thick load of jism down your throat. There’s something about the salty, creamy taste that leaves you so delightfully pleased. You wouldn’t want to go a day without it, let alone miss out on everything these two hunnie bunnies are packing. You open wide and roll out the red carpet before they change their mind and decide to fuck some other slut. You need the cum, damnit!");
	//Heat
	else if(pc.inHeat()) output("\n\nYou’d much rather they take you from the other side of the wall. Two thick, creamy loads of laquine honey would be exactly what you need to extinguish your burning need to breed. They’d probably pump so much into you that you’d look pregnant from the get-go, but you’ve got to make do with what you have. If that means opening wide and rolling out your tongue like a red carpet, so be it. Maybe a stranger can fuck a baby into you while you suck them off...");
	//Else
	output("\n\nYou’re too turned on by this point to come up with any objections to this turn of events. Already, your mouth is filling with saliva at the thought of tasting Gray’s big, hard boner. You look up as they get closer and flash your most winning smile. Maybe they’ll be gentle - or at least wait until you’re too cock-drunk to care before they start really pounding away at your face.");
	//Merge
	output("\n\nGray’s dick comes to rest right in front of your [pc.face]. You cross your eyes for a better look at the veiny beast, admiring how it glistens under the club’s lights, layered in a thick coat of pent-up pre. It actually muffles the musk under a cloud of head-spinning sweetness. The tip is fat and flared like any average laquine’s, but the shaft is what’s special. Instead of one ring around the middle as is typical of the equine endowed, she has four, spaced evenly along the shaft.");
	output("\n\nMidway through that observation, the biggest, fattest dick in the universe is pushing past your [pc.lips] and onto your tongue, and it tastes... kind of sweaty. There’s the salty flavor of long hours spent dancing in the club mixed with bits of sweetness from freely dribbled pre, and beneath it all lurks the raw, meaty taste of her cock. You unintentionally flutter your eyelashes as you try to cope with the taste, not resisting in the slightest as it slides deeper into your mouth. It pauses at the entrance to your throat long enough for Pink to kneel next to you snap a quick holo-selfie.");
	//can deepthroat
	if(pc.canDeepthroat()) output("\n\nWhen the gray-furred slut-bun deigns to thrust the rest of the way into your drooling cock-socket of a face, you welcome it. Your throat is practically built to take deep dickings. Gag reflexes are a thing of the past. Groaning so that your voice can pleasantly vibrate the thick laquine rod on its journey, you try not to cum on the spot. There’s something so magnificent about being taken and filled so completely that you can scarcely believe you’re getting to experience it.");
	//Can’t deepthroat
	output("\n\nWhen the gray-furred slut-bun deigns to thrust the rest of the way into your drooling cock-socket of a face, you’re surprised to find that your gag reflex is curiously absent. There’s no pain or discomfort at all! You’re free to lie there and enjoy the sensation of being absolutely stuffed with cock. You can’t be blamed for groaning like a wanton slut as slobber dribbles down your chin or delighting in the warm wet trickles of pre bubbling into your belly. You mentally utter a prayer of thanks to whatever god blessed you with this sublime, dick-pleasing ability.");
	//Merge
	output("\n\nTears bead at the corners of your eyes, but not from pain. There is certainly a physical element to the small droplets of budding moisture; your jaw is sorely strained by the slick stick of herm-meat bracing it wide, pinning your tongue to the floor of your mouth. Tears are part of the job. There’s a reason pornstars get the heavy-duty waterproof mascara. Why ruin your make-up on the first take?");
	output("\n\nYet your watery leakages are driven by something else - something joyous, spurred around a mental state that’s slipping inch by inch into a euphoria-flooded ditch. Yes, you feel dirty. You feel used. You feel balls slapping into your chin and the rich musk of your groaning laquine lover tickling your nostrils. You feel ");
	if(pc.hasVagina()) output("your [pc.vaginas] flexing in anxious need, your [pc.hips] wiggling to rub your slippery lips around your very swollen [pc.clits].");
	else if(pc.hasCock()) output("your [pc.cocks] straining and dribbling, each cock-filled swallow provoking " + (pc.cockTotal() == 1 ? "it":"them") + " to twitch passionately.");
	else output("your [pc.asshole] rhythmically clenching and relaxing, offering itself to anyone who wants to play.");
	output(" All of those degradingly sexual sensations blend together into a gestalt of disturbingly erotic relief, the more casually you’re used, the more enjoyable the situation becomes.");
	output("\n\nYou don’t have to worry about piloting a ship or looking for probes while you’re bound up and face-fucked like this. You don’t have to talk or fight or even think if you don’t want to. You just have to hang there and remember to breathe when you get the chance. You can smile and look up while you wiggle your tongue under Gray’s big, throbbing horse-cock, or you can passively sit there and let her hips do all the work, pounding that many-ringed horse-cock nearly into your belly on every thrust. Either way, dribbles of thick laquine cream flow in a buffet of endless rewards.");
	output("\n\nThe euphoric buzz of submissive service presses heavily in the back of your mind as you’re used, flattening out unkind thoughts in the same way that the thick phallus irons the wrinkles out of your tongue. You gurgle out a half-giggle when you feel the bunny-horse’s heavy nuts twitch, sloshing with seed that’s just out of reach. You " + (!pc.isDependant(2) && !pc.isBimbo() ? "aren’t sure why, but you want it. The very idea of such a turgid, bestial prick ballooning <i>for your lips</i>, cumming for your stomach, is exquisitely erotic. Enough to make your [pc.thighs] quiver.":"can’t wait for her to unload. The very idea of such a turgid, bestial prick ballooning <i>for your lips</i>, cumming for your stomach, is almost orgasm-worthy on it. You hollow your cheeks, automatically sucking a little hard to wring out all the yummy bunny-cream."));
	output("\n\nThe second cock slapping onto your head jolts you out of your slurping reverie, reminding you that there’s <i>two</i> horny laquines with a need for service. Pink is leaking almost as much as gray, her pre-seed sliding " + (!pc.hasHair() ? "over your scalp":"into your [pc.hair]") + " like sexual shampoo. You bat your eyelashes innocently up at her, at least until the curtain of slick herm-goo cascades down your forehead and webs them shut. You’re left to get by on taste, smell, and feel, and right now, all three of those sensations are utterly suffused by throbbing hard cock.");
	output("\n\nUntil a finger hooks into the corner of your mouth and pries it wider.");
	output("\n\nSpit and pre bubble out of the gap in the brief moment it takes Pink to plug the hole with her cock, pressing so hard that the burgeoning flare of her blunt tip folds back a bit before it pops inside. Once it burrows in, the rest of the narrower shaft has an easy time of it. Gray already stretched you and lubed you up. The second prick can glide right in alongside its sister, the two big, sweat-greased poles gliding against your throat and each other in an orgy of phallus-obsessive lust. They pump back and forth through your maw, forcing your jaw so wide that you doubt it’ll ever close the whole way again. Your [pc.lips] are tight and shining, glossy with the mixed juices, hugging the sloppy poles like one big cock-ring.");
	output("\n\nIf you weren’t coated in a thick layer of goo already, the bunny-sluts would see your eyes rolling back from a combination of ecstasy and oxygen deprivation. They’re too busy fucking your face to care, though. They take turns, one pumping in while the other slides out, providing each other with an extra layer of friction while at the same time allowing enough room for the other wide-hipped  bun-slut to go balls-deep into your cock-molded throat. Heavy balls brutalize your chin even as your stomach swells with the doubled loads of pre. Bubbles of it dribble out of your nose and the corners of your sluttily straining mouth.");
	output("\n\nDizzy from lack of oxygen, you can only imagine how depraved you look, but you’ve got a pretty good idea, remembering how the other wall-mounted cock-socks looked, gasping and glazed, their eyes vacant but dazedly happy, ropes of white cream dangling from their chins, so thick that it forms perverse webs.");
	output("\n\nYou’re just like them, or at least you will be soon.");
	output("\n\nBoth girls begin to properly flare at about the same time, their swollen horse-members competing to see which can stretch you wider. The cooperative rhythm they had falls apart into a series of juddering thrusts, both pumping as deep as they possible can, fighting with sweaty hips to get a quarter inch deeper.");
	output("\n\nYou shudder as the feeling drives you to a miniature orgasm, your whole body shuddering in confinement.");
	output("\n\nCum pumps into your body a moment later. Pumping is the only way to properly describe how they pneumatically inflate you, the twinned streams of sperm-packed herm-spooge flooding your innards with gusto. The padded restraint actually gives a little to make room for your expanding [pc.belly]. Cute grunts fill your dizzy ears, drowning you in the sound of their audible pleasure while they drown the rest of you in far more visceral cum. Excess spunk sprays out of the corners of your mouth when your taut cum-gut reaches, but they’re still cumming. Thick, cummy dribbles coat your lip from where they leak out of your nose.");
	output("\n\nOne of the girls slaps the wall, and you hear a mechanical click.");
	if(pc.hasVagina())
	{
		output(" A plastic cock, every bit as big as the one in your mouth slams hard into your [pc.oneVagina], pounding you with rapid, brutal strokes that would bring you to orgasm - if you weren’t already sliding over your peak from the feeling of being used as a living cum-sponge.");
		if(pc.vaginalVirgin) output(" <b>It isn't real, but you feel despoiled all the same, your virginity stolen by the powerful thrusts of this dildo.</b>");
	}
	else if(pc.hasCock()) 
	{
		output(" A slick, rubberized tube slides over [pc.oneCock], pulsating in rhythmic gyrates that would have you orgasming in seconds - if you weren’t already sliding over the edge from the feeling of being used as a living cum-sponge.");
	}
	else 
	{
		output(" A big, fat, plastic cock pounds into your [pc.asshole], fucking you with brutal strokes that would bring you off in seconds if you weren’t already slipping into ecstasy from the feeling of being used as a living cum-sponge.");
		if(pc.analVirgin) output(" <b>It isn't real, but you feel despoiled all the same, your virginity stolen by the powerful thrusts of this dildo.</b>");
	}
	output("\n\nYou climax so hard that your entire body seizes and thrashes. Not even the restraints can hold you strill. Your shuddering, squeezing throat milks out one last rope before the laquines slide back and watch you pleasure-seize. Of course they’re still cumming. Heavy ropes splatter across your brow and your back. They bathe you in cum while the mechanical stimulation suspends you in an endless orgasm that refuses to abate, even when your vision narrows into a black-lined tunnel.");
	output("\n\nThe last thing you see are Gray and Pink holding their dicks up to your lips. The last thing you feel is their taste on your tongue.");
	output("\n\nYou pass out with the knowledge that being a slut feels very, very good.");
	processTime(40);
	pc.orgasm();
	pc.libido(1);
	pc.taint(1);
	clearMenu();
	addButton(0,"Next",wallSlutEpilogue);
}

public function wallSlutEpilogue():void
{
	clearOutput();
	showPunkSecOp();
	author("Fenoxo");
	output("You’re outside the cargo elevator");
	if(pc.isHerm() && pc.isSquirter()) output(" and drenched in your own mixed fluids");
	else if(pc.hasCock()) output(" and covered in your own [pc.cum]");
	else if(pc.hasVagina() && pc.isSquirter()) output(" and drenched in [pc.girlCum]");
	else if(pc.hasVagina()) output(" and decidedly moist between the [pc.thighs]");
	if(pc.hasVagina() && pc.isSquirter()) pc.applyPussyDrenched();
	if(pc.hasCock()) pc.applyCumSoaked();
	output(". You open your mouth on instinct, but there’s no dicks there this time - just a laughing kaithrit and the slow tingle of your brain untangling itself.");
	output("\n\nTwirling a pair of antigrav cuffs around one finger, the security operative turns away. <i>“Keep your nose out of where it doesn’t belong.”</i> [enemy.HeShe]’s entirely too amused to deliver it seriously. <i>“Freelancers don’t belong around the special project. Really. But if you make a thing out of this, I’ll make sure you belong <i>to me</i>. Got it?”</i> [enemy.HeShe] looks back over [enemy.hisHer] shoulder, enjoying your flushed state. <i>“Or keep coming back, I guess. I could use a slave like you.”</i>");
	output("\n\n");
	CombatManager.genericLoss();
}

//Slit Slut hypnoprogram
public function slutSlutLossScene():void
{
	clearOutput();
	showName("PUSSY\nSLUT");
	author("Fenoxo");
	output("<i>“Hi there.”</i> A breathy voice whispers in your ears, accompanied by the sight of a faintly glowing kaithrit sex-pot. <i>“I’m Anayill Siltoya, and welcome to your first day on the job as a TamaniCorp female relief specialist, more commonly known as a pussy-slut.”</i> She smiles winningly. <i>“The idea of being blindfolded and mounted with your face in the seat of a chair for twelve hours a day might seem kind of scary to you right now, but I promise that by the time you’ve finished this training holo and undergone the complimentary libido adjustment, you’ll be looking forward to it.”</i>");
	output("\n\nAnayill flashes two thumbs up, and " + (pc.lust() < pc.lustMax() ? "you are suddenly, irrevocably horny. It’s a warm buzz of pleasure, like she just swept you up in a hug, mixed with an undercurrent of want and desire.":"you are suddenly more than just horny. You’re pleased to be so. You’re <i>happy</i> to be aroused. Somehow, her approval has made your rampaging libido feel like a good thing."));
	output("\n\n<i>“That feeling? What you’re feeling right now? That’s what you’re going to be feeling every day on the job. And that’s on a bad day.”</i> Her wink is so comically overdone that you wish you could make yourself cringe at it, wish you could find it anything less than wonderfully endearing. What a cutie! <i>“At TamaniCorp pleasure is our specialty, and soon to be yours.”</i> Anayill playfully mimes shooting at you. <i>“So hold still, and let’s get started with your training.”</i>");
	output("\n\nThe curvy kaithrit’s image retreats to the corner of your vision. A pink flash occupies everything. You wince, but it is swift to fade into a new reality. Not entirely unexpectedly, you’re mounted in a chair, your upraised face immobilized between two cushions. From the neck down, every part of you is wrapped in something soft and breathable. Gentle vibrations stimulate your muscles to keep you from cramping.");
	output("\n\nYou sigh in relief. It’s not all that bad.");
	output("\n\n<i>“I promised you’d like it! Since we don’t have all day to waste on training like those dopes over at KihaCorp, why don’t we start the programming?”</i> She snaps her fingers.");
	output("\n\n<i>Static.</i>");
	processTime(4);
	pc.lust(50);
	clearMenu();
	addButton(0,"Next",pussySlutV2);
}

public function pussySlutV2():void
{
	clearOutput();
	showName("PUSSY\nSLUT");
	author("Fenoxo");
	//Cutsie nervous lizardgirl with a chubby pussy
	output("A young girl, covered head-to-toe in reptilian scales, looms above. Her knees knock together, but she’s naked as the day she was born (or hatched), her chubby, aroused pussy easily visible. The lips are deliciously thick. A thin droplet rolls down the left one as she turns and hesitantly spreads her thighs, better displaying her cunt. The velvety entrance is closed for now, but the lower she squats, the more it twinkles with moisture and twitches with barely suppressed arousal.");
	output("\n\nYour lips are suddenly very, very parched and your ");
	if(pc.hasCock()) output("[pc.cocks] very hard");
	else if(pc.isHerm()) output(" and ");
	if(pc.hasVagina()) output("[pc.vaginas] very wet");
	if(!pc.hasGenitals()) output("crotch simmering");
	output(". Her scent is reaches your nose, mild and alien but desirable all the same. You thrust your [pc.tongue] out, straining to reach it, yet she’s not low enough yet. A single droplet forms on her clit when her silky, delectable slit drops a few inches lower. She’s almost there. Her ass is almost ready to sit down on the cushions and grant you access to that slippery treasure trove of feminine moisture and...");
	output("\n\n<i>Static.</i> <i>“Very good. You’re a natural!”</i>");
	processTime(4);
	pc.lust(20);
	clearMenu();
	addButton(0,"Next",pussySlutV3);
}

public function pussySlutV3():void
{
	clearOutput();
	showName("PUSSY\nSLUT");
	author("Fenoxo");
	//Confident MILF terran. Very wet.
	output("The sweet-looking reptile-woman has vanished. In her place, a grinning terran approaches. She’s well into her thirties by the look of her, blessed by the combined curvaceousness of births and a life well lived. She smiles sweetly and pivots in preparation. Her pussy is nothing like the lizard-girl’s. It’s less engorged but so much <i>wetter</i>. Juices stream down her thighs as she wiggles into position, her hands reaching down to hold onto either side of the seat for support.");
	output("\n\nThe thick scent of mature cunt strikes you like a brick to the face. One moment you’re gazing up, licking your chops thanks to a sense of lust you don’t entirely understand, the next you’re straining against the box’s soft confines, desperate to smash your face into <i>her</i> box and drink in her scent for the rest of your days. She’s sweet and perhaps more importantly, <i>fertile</i>. Her pussy flexes and winks, droplets as clear as morning dew hanging from her lips.");
	output("\n\nOne falls onto your outstretched tongue and splashes its tangy flavor over a wide swath of your tastebuds. It’s delicious - better than icecream. On some level you know that the taste itself isn’t really that amazing, that the tingle in the back of your head is playing hell with your nerves and cross-wiring disparate sensations into a soup of swampy, puss-addicted submission, but you can’t help it. You want it. You want that slick, wanton hole smashed into your face.");
	output("\n\nWatching it descend is like unwrapping a christmas present; with each passing second, more glorious detail is revealed. The gentle slopes of aroused feminine lips resolve into a hypnotic wonderland of glittering lust. The clit pops out of the hood, hovering over tongue, promising to reward your tongue with more heavenly taste once you adequately serve it. Slowly yawning open, the bright pink interior at last reveals itself, flexing and squeezing in anticipation of taking your entire tongue to the root.");
	output("\n\n<i>Static.</i>");
	processTime(5);
	pc.lust(20);
	addButton(0,"Next",pussySlutV4);
}

public function pussySlutV4():void
{
	clearOutput();
	showName("PUSSY\nSLUT");
	author("Fenoxo");
	output("The glowing kaithrit is back. Anayill? Whatever her name is. You can’t be bothered to look up to her face, not when she’s missing her bottoms and swiveling her hips to keep your increasingly cunt-focused thoughts between her legs.");
	output("\n\n<i>“Good news! If you’re hearing this, then the program has identified you as an exceptionally receptive pussy-slut-in-training.”</i> She dips a finger into her twat and lifts the glistening digit up in front of you, waving it back and forth and smiling when you futilely lunge for it, still bound in the traitorously pleasant confines of your slut-box. <i>“That or your training goggles have had the power bumped to unsafe levels to expedite your training. Either way, you’ll be tasting a whole lot more of this soon.”</i>");
	output("\n\nThat drenched fingertip pushes into your mouth, and you’re in heaven. Your tongue swirls rapidly around, harvesting it of every bit of its perfect moisture. Your cheeks hollow as you suck hard, pulling it in to the knuckle.");
	output("\n\n<i>“Oh my, you are <b>ravenous</b>! Let’s just verify that your dopamine responses stay stupidly high when dealing with a few of our more exotic clientele, and we can get you set up and ready to lick in no time!”</i> Anayill snaps her fingers.");
	output("\n\n<i>Static.</i>");
	processTime(5);
	pc.lust(20);
	addButton(0,"Next",pussySlutV5);
}

public function pussySlutV5():void
{
	clearOutput();
	showName("PUSSY\nSLUT");
	author("Fenoxo");
	//Big phat leithan
	output("Your mouth is <i>empty</i> once more, and your giggling kaithrit trainer is gone! Fortunately something else has taken her place: something six-legged and armor plated with big, fat, cunt that looks like it belongs on an animal instead of a person. Rubbery black lips ring the six-inch long gash, winking in mild arousal as a thumb sized clit slowly reveals itself along the underside. A sheen of gleaming moisture coats the innermost edge of the " + (CodexManager.entryUnlocked("Leithans") ? "leithan":"creature") + "’s chubby folds, gradually spreading outward as she canters back on noisy hooves.");
	output("\n\n" + (!CodexManager.entryUnlocked("Leithans") ? "There’s probably a humanoid torso mounted up there somewhere, but you’re long past caring about the specifics of who or what sits on your face. So long as you have a pussy present and ready to drop onto your mouth, you’re happy.":"You know there’s undoubtedly a human torso mounted up there, but you’re long past caring about what the rest of your partner looks like so long as they have a pussy present and ready to press against your face.") + " Even if the " + (!CodexManager.entryUnlocked("Leithans") ? "alien":"leithan") + " wasn’t a second away from smashing her puffy hole onto your mouth (and she is), you’d be content just being this close to it, getting into drink in its uniquely pheromonal signature while you watch its wetness spread.");
	output("\n\nBeads of girlcum drizzle down her clit, collecting into a shimmering droplet a moment before that huge pleasure-nub bounces against your chin. Gloriously engorged lips smother your cheeks as the entirety of the alien’s big fat quim spreads over your [pc.face], enmeshing you in a cunnilingual heaven.");
	output("\n\nYou can scarcely breathe, a thought that paradoxically fills you with pleasure. Your own comfort comes secondary to this puffy pussy’s satisfaction. That sinful knowledge and the deluge of decadent pheromones leave you dizzy and throbbing with passion");
	if(pc.hasCock()) output(", your [pc.cocks] jerking and dribbling at the very peak of ecstasy");
	else if(pc.hasVagina()) output(", your own [pc.vaginas] drooling and rhythmically clenching at the very peak of ecstasy");
	output(". This sapient she-mare has given you more cunt you could have imagined in your wildest dreams, and as you struggle to inhale the slightest bit more of her musk, you realize that this feels an awful lot like falling love.");
	output("\n\nEyes closed, you worship her on autopilot. Your tongue somehow <i>knows</i> exactly where to go and what spots to lick. It traverses the maze of rippling muscle with a native’s intimate knowledge, whipping up to caress clusters of nerves and flexing to slide across neglected channels. Your jaw hurts from opening so wide, but it’s the only way to satisfy the aching thirst for more girlcum. You’re dimly aware that you’ve become drenched in it from the top of your head all the way down to your chin, but you want more. You want to bathe in it. You want to drink her relief until your body is more pussy-juice than water.");
	output("\n\n<i>Static!</i>");
	processTime(5);
	pc.lust(20);
	addButton(0,"Next",pussySlutV6);
}

public function pussySlutV6():void
{
	clearOutput();
	showName("PUSSY\nSLUT");
	author("Fenoxo");
	//Kuitan!
	output("You sigh when relief when you realize that there’s still a pussy on your face. You won’t have to face the room’s cold air or wait, <i>bored</i> and alone without a cunt to occupy your time. This one’s not quite as big or as wet, but it’s much, much softer. The flesh has a spongy, forgiving quality to it that begs for your tongue to spear deep inside. Soft fur tickles your cheeks... and your chin as your nose picks out a pair of twinned musks, one feminine and one a richer, masculine note.");
	output("\n\nYou’re servicing a hermaphrodite! While it may be a surprise, it doesn’t slow you down. Why would it? Having a heavy bar of balls rubbing against your chin just gives you an additional piece of feedback. When they clench and rise up, you know you’re doing something right. You slurp and lick at the furry herm’s unsatisfied female anatomy until her balls pulse with a swell of freshly brewed cum. At the same time, a rush of fresh, girlish goo pours into your maw, and you realize that you’re addicted to the taste already. The concentrated flavor of this furry slut’s slit is the most wonderful thing in all the known universe.");
	output("\n\nUncaring for how loud it sounds, you suck with abandon. You make love to the juicy honeypot with your face and smile when her balls churn and rock against your chin. Daringly, you slide your tongue down to favor them with a lick, but just one! You’re right back into that pussy after, where you belong. That exploratory caress was only to take your slick-furred client’s attention somewhere else so that you could surprise her with a sudden, deep thrust.");
	output("\n\n<i>Static.</i> <i>“Very good. Now keep licking! An orgasm ought to convince you that you made the right decision by coming to us!”</i>");
	processTime(5);
	pc.lust(20);
	addButton(0,"Next",pussySlutV7);
}

public function pussySlutV7():void
{
	clearOutput();
	showName("PUSSY\nSLUT");
	author("Fenoxo");
	//Doublecunted pornoslut with strawberry and vanilla pussyjuice.
	output("The furry woman’s soft slit and soothing squeezes are gone. In her place is a pink-skinned humanoid with two pussies. You nearly cream yourself with relief at the sight. You get to service two whole vaginas at once? You get to nuzzle your nose  in between <i>two</i> sodden slits and inhale their enticing aroma while your tongue flutters back and forth, gathering their combined precipitations? It’s almost too good to be true.");
	output("\n\nYou’re so taken aback by the delightful muff buffet that you miss another intriguing attribute of your girlishly blessed guest - each of her pussies has <i>two</i> clits - one above and one below. For a second you wonder how she can walk anywhere without cumming, how she can manage to grind those four sensitive nubs between her thighs together without driving herself mad. Then you see the state of her thighs. They’re drenched. The fragrant, fruity scent of her girl-cum is everywhere as she fidgets atop you, humping your face even before you’ve started to lick.");
	output("\n\nJust like before, your tongue flashes out, arbitrarily choosing the leftmost entrance to burrow into. <i>She tastes like ripe strawberries.</i> You swoon from the flavor, but still you lick. You breathe through your nose, drowning yourself in her, your mind increasingly vacant of all but the raw sensory experience, the carnal sights and smells occupying every part of your brain that isn’t busily directing your tongue’s eager flexing. Everything is strawberries and slickness and passion and-");
	output("\n\nThe transition to the second pussy happens instantaneously, this one vanilla flavor. It shocks you back to cognizance for a second, but only for a second - long enough for you to mentally remark that you really, really love working for TamaniCorp. Then you’re back on autopilot. Vaguely happy to be so desirous and so very useful in the way that you derive arousal.");
	output("\n\nA screech of pleasure from above is better than a ");
	if(pc.hasCock()) output("mouth around [pc.oneCock]");
	else if(pc.hasVagina()) output("cock in [pc.oneVagina]");
	else output("cock in your [pc.asshole]");
	output(". The rush of girlcum flooding your mouth and drenching your cheeks is stunningly pleasurable. Your eyes would be crossed if they weren’t rolled back so far. Her orgasm is everything. Your tongue twirls from clit to clit to prolong it as long as possibles. Thighs quiver against your forehead, the sign of a job well done. Your breaths are rapid and feverish as her climax wrings a second torrent of strawberry-vanilla approval all over your face, and you’re cumming too.");
	output("\n\nYour orgasm rips through your body and your brain, ecstasy intertwined with the sight and taste of climaxing pussy. Arousal interweaves with the scent of a lusty woman and the warmth of her thighs." + (pc.hasCock() || pc.isSquirter() ? " There is no room in your mind to wonder what happens to your own sexual fluids, though if you had the mindspace to puzzle over it, you’d assuredly come to the conclusion that your new home is designed handle such emissions.":"") + " You lick throughout, somehow aware the more aggressively you serve her the better your own climax will feel.");
	output("\n\nBy the time the sticky thighs deign to rise, you’re so dizzy that you know you’d collapse if you tried to stand up. The pink-skinned girl sighs happily and pulls up her panties, leaving you to lick her residue from your lips.");
	output("\n\nThis is heaven.");
	output("\n\nAnayill reappears, flashing two thumbs up. <i>“Congratulations on completing your TamaniCorp female relief specialist training. By now you’re a certified pussy-slut! Since you may have completed your training before the rest of your class, I’m authorized to simulate the experience of servicing me personally until your supervisor comes by to take you to your service chamber. And don’t worry! We still have weeks of on-the-job reinforcement training to go through, so you’ll be seeing a lot more of me-”</i>");
	output("\n\n<i>Static.</i> The goggles are ripped off your face.");
	processTime(30);
	pc.orgasm();
	pc.libido(2);
	pc.taint(1);
	clearMenu();
	addButton(0,"Next",pussySlutEpigloe);
}

public function pussySlutEpigloe():void
{
	clearOutput();
	showPunkSecOp();
	author("Fenoxo");
	output("You’re outside the cargo elevator");
	if(pc.isHerm() && pc.isSquirter()) output(" and drenched in your own mixed fluids");
	else if(pc.hasCock()) output(" and covered in your own [pc.cum]");
	else if(pc.isSquirter() && pc.hasVagina()) output(" and drenched in [pc.girlCum]");
	else output(" and decidedly moist between the [pc.thighs]");
	output(". You open your mouth on instinct, but there’s no pussy there this time - just a laughing kaithrit and the slow tingle of your brain untangling itself.");
	output("\n\nTwirling a pair of antigrav cuffs around one finger, the security operative turns away. <i>“Keep your nose out of where it doesn’t belong.”</i> [enemy.HeShe]’s entirely too amused to deliver it seriously. <i>“Freelancers don’t belong around the special project. Really. But if you make a thing out of this, I’ll make sure you belong <i>to me</i>. Got it?”</i> [enemy.HeShe] looks back over [enemy.hisHer] shoulder, enjoying your flushed state. <i>“Or keep coming back, I guess. I could use a slave like you.”</i>");
	processTime(2);
	output("\n\n");
	CombatManager.genericLoss();
}

//Victory
public function defeatASecop():void
{
	//HP
	if(enemy.HP() <= 1) output("\n\nFalling to the ground with a whine and a burst of sparks, the kaithrit security operative barely catches [enemy.himHer]self on [enemy.hisHer] hands and knees. [enemy.HisHer] arms wobble for a second before [enemy.heShe] pivots to fall heavily on [enemy.hisHer] [enemy.butt]. <i>“Fine, fine. I guess you </i>do<i> belong up here. Just... don’t fuck me up too bad, alright? If you try and off me, every other Cyber Punk on station’ll be swarming over you worse than Rat’s Raiders on a corporate freighter.”</i> [enemy.HeShe] jabs sharply at the antenna above [enemy.hisHer] ear, panting heavily but otherwise lacking any life threatening injuries. <i>“If the apology isn’t good enough for you, there’s other ways I can make this up to you with my tongue. Just... no more weapons, okay?”</i>");
	//Lust
	else output("With a cry of all-consuming lust, the kaithrit security operative falls heavily on [enemy.hisHer] knees. The metal coils of [enemy.hisHer] suit part as if by magic to reveal the fullness of [enemy.hisHer] " + (enemy.hasCock() ? "gleaming, 13-inch robotic cock":"absolutely drenched alien cunt and needy little clit") + ". <i>“Ffffffffuck! You’re so hot!”</i> [enemy.HeShe] " + (enemy.hasCock() ? "wraps both hands around the metallic behemoth and pumps hard.":"thrusts three fingers deeply into her hungry passage, the other palm grinding hard just above.") + " <i>“I don’t even care if you belong up here! You belong fucking me!”</i> The mewling feline’s ears fold back as [enemy.heShe] looks up at you. <i>“Please! I need you!”</i>");
	output("\n\n");
	clearMenu();
	if(pc.isTaur()) addDisabledButton(0,"Fuck Her","Fuck Her","Your ‘taur frame prevents this.");
	else if(pc.hasCock())
	{
		if(pc.cockThatFits(enemy.vaginalCapacity(0)) >= 0) addButton(0,"Fuck Her",penisRouter,[fuckTheSecopGirl,enemy.vaginalCapacity(0),false,0],"Fuck Her","The big-titty cyber-kitty has plenty of augments. You could take her for a spin, really test drive her sensitive bits.");
		else addDisabledButton(0,"Fuck Her","Fuck Her","This cat may have a special kind of pussy, but even it can’t handle your girth. You’d slag her system!");
	}
	else addDisabledButton(0,"Fuck Her","Fuck Her","You’ll need a penis to fuck that robo-pussy. You doubt she has the means or the inclination to surgically attach one to you.");

	//Get Licked - Either
	if(pc.hasVagina()) addButton(1,"Get Licked",vaginaRouter,[getLickedBySecop,0,0,0,false],"Get Licked","Force the kitty-[enemy.boyGirl] to apologize with [enemy.hisHer] tongue.");
	else addDisabledButton(1,"Get Licked","Get Licked","You need a vagina for this.");
	//Facefuck - Either
	if(pc.hasCock()) addButton(2,"Facefuck",penisRouter,[faceFuckDatPussy,9998,false,0],"Facefuck","Put this mouthy Cyber Punk kaithrit to work on your dick.");
	else addDisabledButton(2,"Facefuck","Facefuck","You need a penis for this.");

	addButton(14,"Leave",CombatManager.genericVictory);
}

// Fuck Her
// Scene idea overall: PC will go down on the kaithrit, and can choose to drink her milk or not, but they’ll still get squirted. She’s outputting aphrodisiac vanae milk. If the player drinks, she’ll try to domme the PC cowgirl style, but the PC will win back and fuck her into the ground. If the player gets squirted, they’ll pound her doggy style. Vanae milk makes the imbiber horny as hell and can induce psychoactive effects. Either way, you’re both walking away happy. Well, she’s not walking away for a while after this.
public function fuckTheSecopGirl(x:int):void
{
	clearOutput();
	showPunkSecOp(true);
	author("William");
	// ‘Punk HP Loss
	if(enemy.HP() <= 1)
	{
		// PC bimbo
		if(pc.isBimbo()) output("<i>“A tongue’s, like, nowhere near good enough for me right now,”</i> you shake your head imperiously" + (!pc.isCrotchExposedByArmor() ? ", throwing your [pc.armor] to the side":"") + ". <i>“I wanna see what else you’ve got in your toybox, kitten!”</i>");
		// PC bro
		else if(pc.isBro()) output("You chuckle good-naturedly, and a little airheadedly" + (!pc.isCrotchExposedByArmor() ? " as you get yourself free of your [pc.armor]":"") + ". <i>“No, a tongue’s not in the cards. What say you and I put those metal bits to use?”</i>");
		// PC kind
		else if(pc.isNice()) output("<i>“I’m willing to bet you owe a lot of people more than a little tongue action.”</i> You fold your arms and smirk. <i>“Myself included,”</i> you point to her crotch" + (!pc.isCrotchExposedByArmor() ? " just before shucking your [pc.armor]":"") + ".");
		// PC misch
		else if(pc.isMischievous()) output("<i>“A thinly veiled threat is a shitty apology, kitten. That aside, your mouth’s just a bonus,”</i> you kneel next to her, running a hand gently across her sugary chest and down to her warm crotch" + (!pc.isCrotchExposedByArmor() ? " before slipping out of your [pc.armor]":"") + ". <i>“I think I’ve earned something a little more fun than that...”</i>");
		// PC hard
		else output("<i>“I agree. No more of <i>your</i> weapons,”</i> you huff, sinking down near the bosomy techno-feline, grasping for her crotch" + (!pc.isCrotchExposedByArmor() ? " after nonchalantly removing your [pc.armor]":"") + ". <i>“But mine’s going to need a lot more than a tongue.”</i>");
		// Merge
		output("\n\n<i>“Uh, alright,”</i> she calmly acquiesces. Her fancy suit practically disassembles just a moment later. The kaithrit pirate’s massive tits, enormous G-cups, spill out, much more exaggerated than her womanly curves. A purplish, semi-transparent liquid oozes from her budding teats. With a comfortable sigh, she spreads her thunderously thick legs, making sure you get an eyeful of her canvas; her most obvious features are the seams where organic meets synthetic.");
		output("\n\nShe’s strangely happy to expose her modified body to your analytical eyes... maybe she likes showing off the work she’s had done?");
		output("\n\nBefore you can be impressed by her obvious genital augmentation, and entranced by the tell-tale scent of ripe catgirl in the air, you find yourself gazing longingly at her matronly chest; your eyes half-close and you bite your lower lip. You’re wholly captivated by the traces of feline sweat trailing along her sugar-pillows and the marble-violet beads of gooey goodness leaking from her puffy cyber-nips.");
		output("\n\n<i>“Those modded, too?”</i> you blurt out, a shameless and silly grin etched on your reddened face. Your [pc.cocks] " + (!pc.isCrotchExposedByLowerUndergarment() ? "press against your [pc.crotchCovers], soiling your undergarments with every hypnotizing jiggle of titflesh":"jump to full mast, pulsing with every hypnotizing jiggle of titflesh") + ".");
		output("\n\nBlinking in mite surprise, the punky cat smirks as the light of her hi-tech visor evaporates. She wraps her arms under her luxurious, lactating chest, rocking her shoulders with a sexy bounce. <i>“Oh... A little. Do you like them? It’s doubtful you’ve encountered quality like this...”</i> she purrs, rolling her milk-bubbling teats between her fingers, sprinkling the ground with criminally wasted cream." + (pc.cocks[x].cLength() >= 18 ? " <i>“It seems they’re to your liking,”</i> she winks, her slit-pupils widening in admiration of <i>your</i> strongly throbbing equipment.":""));
		output("\n\nYour cortex is overwhelmed by the tranquilizing wobble of bombshell tits, and you soon dive mouth-first into those soft, irresistible mounds of ambrosial goodness. You drag your [pc.tongue] over one nipple and then the other, handling these heavenly boobs with the utmost care - this comely bust deserves nothing less. A strange, inflaming buzz in the back of your mind makes your [pc.eyes] cross with every smearing droplet you hungrily lap up, and a rush of warmth blossoms throughout your body. Bubbling, almost boiling pre-seed floods from your [pc.cocksLight]" + (pc.hasVagina() ? ", and you feel a distinctly stronger heat emanating from your [pc.pussies]":"") + ". The orderly feline coos quietly, content to hold her arms together, to thrust her divine chest out into increasingly greedy palms.");
		// PC breasts small (A-cup > C-cup / rating: 1 to 3 )
		if(pc.biggestTitSize() < 4) output("\n\nYou can’t ignore the wincing pangs of envy burning through your cheeks: this kitty-pirate’s size makes your own [pc.breasts] look bland and pathetic in comparison." + (pc.isBimbo() ? " Really, there’s no reason <i>you</i> should have these kinds of blasé tits! In this galaxy of all places!":"") + " One firm hand " + (!pc.isChestExposed() ? "slips your [pc.chestCover] aside, giving":"gives") + "your [pc.nipples] a little appreciation in return, though! <i>“Good size for a wanderer like yourself, and pleasantly soft. Oh, your nipples are just right! So hard they could cut rock, in fact!" + (!pc.canLactate() ? " If only you had milk to share...":" And your taste is simply sweet...") + "”</i>");
		// PC breasts big (D-cup to big FF-cup / rating: 4 to 14)
		else if(pc.biggestTitSize() < 15) 
		{
			output("\n\n<i>“You like mine? I like yours, too. You’ve got an ideal size, even if they’re not quite a match to mine,”</i> the pirate smiles, gingerly " + (!pc.isChestExposed() ? "slipping your [pc.chestCover] aside and ":"") + "cupping one of your jugs and rubbing towards your own [pc.nipple]" + (pc.canLactate() ? ", squeezing a little [pc.milk] from your tank before inquisitively tasting it. <i>“Oh, that’s lovely. A little bigger and we could make a dairy cow out of you...”</i>":"") + ". You press your [pc.breasts] into her own, rubbing your docked bodies together");
			if(pc.mf("","f") == "f")
			{
				if(pc.cowScore() > 1) output(", mooing like a wanton slut");
				else output("utterly blissed out by this girl-on-girl sluttery");
			}
			output(".");
		}
		// PC breasts bigger (GG-cup or more / rating: >=16)
		else
		{
			output("\n\n<i>“I can see why you love mine, you’ve got... quite a pair yourself, cutie...”</i> The bosomy SecOp seems a little envious of your [pc.breasts]! She moves a hand ");
			if(!pc.isChestExposed())
			{
				output("past your [pc.chestCover] ");
			}
			output("to your [pc.breasts], her fingers tracing lovingly along your ");
			if(pc.canMilkSquirt()) output("[pc.milkType] leaking ");
			if(pc.biggestTitSize() >= 50) output("giant ");
			output("tits, the pliant [pc.skinFurScalesNoun] of your marshmallows fill the space between her fingers." + (pc.canMilkSquirt() ? " <i>“You’d make a good dairy cow with udders like these. Are you Treated?”</i>":" <i>“A shame you have no milk. You’d look good as a dairy-slave, if not a perfect cock-sleeve.”</i>") + " You " + (pc.cowScore() > 1 ? "moo":"moan") + " with every crest of mutual pleasure, bubbly feelings flaring across your brain.");
		}
		// Merge
		output("\n\nYour ecstasy-filled caresses go from gentle to eager, and you’re absolutely certain this fluffy-eared goddess appreciates the tremendous respect you demonstrate to her life-giving chest. You kiss her lightly on the lips, licking slowly across her chest, back down to where the milk drizzles in growing quantities, spilling out like a stream the more aroused the shapely milky-cat becomes. You fondle those snug jugs lovingly in a trance of mammarian design, rolling her yielding breasts in circles" + (pc.balls > 0 ? ", receiving an equally worshipful finger-show on your [pc.sack]":"") + ". You press your body closer, panting and gasping quietly, breathing in the potent, balmy scent of horny kaithrit until you feel a hand on the back of your head. <i>“I think I have an idea of what you <i>reeaalllyyy</i> want...”</i> she hums hotly in your [pc.ear]. <i>“Go ahead, drink to your heart’s content...”</i>");
		if(pc.WQ() < 40) output("\n\nStars, that sounds absolutely fucking wonderful right now! Does she have any augment that can show her how rock hard you are right now? But then... Gosh, you won’t get to enjoy these tits the way you want...");
		else output("\n\n\n\nWhilst that sounds amazing, there’s something about her milk that’s clearly affecting your libido. It’s probably nothing serious! Getting a bellyful of kitty cream is as good a reward as any, regardless of how horny it’ll get you!");
	}
	// ‘Punk Lust Loss
	else
	{
		// PC bimbo
		if(pc.isBimbo()) output("<i>“Fuck yeah, babe! See? It’s totally great when we can just skip the rough housing and get right to what matters most!”</i> you sing, dropping down to the cyber-slut’s level, already moving in for a wet, needful, rewarding kiss." + (!pc.isCrotchExposedByArmor() ? " You break it momentarily just to get your [pc.armor] out of the way. Pesky clothes!":""));
		// PC bro
		else if(pc.isBro()) output("<i>“That’s what I’m talking about!”</i> You fall to your knees and promptly kiss her in barely contained lust." + (!pc.isCrotchExposedByArmor() ? " You break it for a second, receiving a little help in getting your [pc.armor] off.":""));
		// PC kind
		else if(pc.isNice()) output("<i>“I’m glad we could come to terms,”</i> you muse, sinking to the over-aroused pirate’s level, beckoning her with a come-hither pawing. <i>“Come on, let’s take a break together.”</i>" + (!pc.isCrotchExposedByArmor() ? " Just before she gets to you, you shuck your [pc.armor].":""));
		// PC misch
		else if(pc.isMischievous()) output("<i>“First I don’t belong, and now I belong with you?”</i> You chuckle softly, grinning toothily at the whimpering kitten as you kneel down" + (!pc.isCrotchExposedByArmor() ? ", divesting yourself of your [pc.armor]":"") + ". <i>“Looks to me like it’s the other way around!”</i>");
		// PC hard
		else output("\n\n<i>“You’re lucky I think you’re worth my time.”</i> You fall to your own knees, grinning needily at the wide-eyed and hungry cat. <i>“I’ve been looking for a treat myself.”</i>" + (!pc.isCrotchExposedByArmor() ? " You nonchalantly throw your [pc.armor] aside.":""));
		// Merge
		output("\n\n<i>“Oohh, fuck! Don’t hold back, I need you on me!”</i> the punky pirate cries, the light of her hi-tech visor evaporating in an impatient flash. Her fancy armor hastily disassembles, allowing her huge G-cups and curvaceous frame to spill out from their metallic confines. The kaithrit moans loudly in relief - a sexy sound that gets your blood going. Semi-transparent liquid sprinkles from her sugary tits, criminally wasting itself outside of a deserving belly. The sight of her groping her whorish tits on the way has your [pc.cocks]");
		if(pc.cumQ() > 500) 
		{
			output(" spurting boiling pre-seed like a faulty hose");
			if(!pc.isCrotchExposedByLowerUndergarment()) output(", drenching your straining [pc.crotchCoverUnder] with potent musk");
			output(".");
		}
		else output(" straining and beginning to dribble a bit of pre-seed.");
		output("\n\nShe bares her modified, seam-lined body to you as you close in for a warm and wet kiss that she excitedly returns, wrapping her soft-muscled arms around your neck, and thrusting a powerfully augmented tongue past your [pc.lipsChaste]. Your [pc.tongue] is pinned straight away as she gives your cheeks, your teeth, and your throat a once-over, smugly flexing that smooth cybernetic organ all throughout your jaw in impossible shapes, pressing obscenely against every cluster of velvety jawflesh before testing your throat. " + (!pc.canDeepthroat() ? "You gag and cough almost immediately, and she promptly relents.":"Your unresistant throat seals around what it thinks is a big, meaty cock, returning the favor with wet hugs."));
		output("\n\nYour [pc.skinFurScalesColor] hands are drawn to her milk-drizzling melons; the cyber-kitty’s [enemy.skinColor] hands lunge for your crotch. ");
		if(pc.cocks[x].cLength() >= 25) output("<i>“Mmmh, looks like you’re going to be a " + (silly ? "purrfect":"perfect") + " fit...”</i> she moans, manicly groping your sizeable " + (!pc.isCrotchExposedByLowerUndergarment() ? "bulge":"cock") + ".");
		if(!pc.isCrotchExposedByLowerUndergarment()) output(" She hungrily paws at your [pc.cocks], straining mightily against your clothes, desperately looking for the means to remove your [pc.crotchCoverUnder]. It doesn’t take her long at all.");
		else output(" She lustfully jerks your [pc.cocks], moistening her hands and arms in the sheer amount of pheromonal pre-seed flowing from your [pc.cockType " + x + "] meat.");

		output("\n\n<i>“Mmh... That scent... Give me that! I want your dick!”</i> You press yourself to the catgirl’s body, eyes crossing as she furiously pumps your [pc.cock " + x + "]. <i>“Fuck yes... You’re so hard, you’re everything I need!”</i>");
		if(pc.hasClit())
		{
			output(" With her so focused on your manhood, you’re surprised she takes the time to include your [pc.clits], tugging on the ");
			if(pc.clitLength < 2) output("beady bud");
			else output("pseudo-cock");
			if(pc.totalClits() > 1) output("s");
			output(" of clitoral flesh.");
		}
		output("\n\nYou nibble her puffy, synthy nipples, and suck out the barest trickle of ultra-sweet cream in a ginger taste test. A thrumming ache rises in the back of your mind as you gulp it down; your body gradually ignites with every lapped up bead of pirate milk that trickles down her supple, pliant titflesh. Your brain is utterly subsumed by the warmth of fondling, teasing, cupping, <i>worshiping</i> this robo-cat’s heavenly chest, so much so that orgasmically pumping your [pc.cum] all over her is about to become the reality.");
		output("\n\nWell, it will as soon as you bury your raw and ready bone between her vast expanse of eye-encompassing tits and drench her in [pc.cumNoun]!");
		output("\n\nSynapses humping with carnal desire, a fire burning burning bright and hot, you thrust your [pc.cocks] into the sinfully warm enclosure of the milky catgirl’s pillowy breasts" + (pc.hasVagina() ? ", your [pc.pussies] creaming from the rush of it all":"") + ". Her hot channel molds to the shape of your overwhelmingly powerful [pc.cockNounSimple " + x + "]; The antenna on the side of the pirate’s head wobbles from the impact of of your hips ramming against her divine bosom." + (pc.balls > 0 ? " Your [pc.sack] claps lewdly off her tits, coming away drenched in her nerve-inflaming blue milk before slapping and splattering into their underside again.":""));
		output("\n\n<i>“Good [pc.boyGirl]..!”</i> she cries out, squeezing her cushions hard around you again. <i>“Get yourself ready, enjoy this to your heart’s content, because I have no patience for inadequate lovers!”</i>");
		// PC cock smaller
		if(pc.cocks[x].cLength() < 8) 
		{
			output("\n\nYour [pc.cock " + x + "] is easily smothered by the sheer volume of the techno-feline’s heavenly boobflesh, but that’s no big deal, it’s as warm as her pussy promises to be! You wantonly hump her chest, staring into her [enemy.eyeColor] feline eyes. They’re dilated with hunger, widened by the lust addling her modified brain. Your pre-seed soon lubricates her entire torso, mixing with the sweat and treacle of ultra-sweet milk");
			if(pc.cockTotal() > 1) output(", the moistening process aided by your extra dick" + (pc.cockTotal() > 2 ? "s":"") + " flopping around nigh uselessly");
			output(".");
		}
		// PC cock bigger
		else
		{
			output("\n\nYour [pc.cockHead " + x + "] makes frequent trips to the kaithrit’s mouth, your length and girth conquering this pirate slut’s breasts with every pump through her slime-slick channel. She sucks and kisses your [pc.cockNounSimple " + x + "] tip where possible, slurping pre whilst keeping her cock-compressing tits taut with one arm. Her free hand ");
			if(pc.balls > 0) output("adoringly caresses your [pc.sack].");
			else if(pc.hasVagina()) output("busily assaults your [pc.pussy], several fingers deep.");
			else output("happily strokes your taint encouragingly.");
			output(" You’ve soon lubed up her entire torso, mixing your [pc.cumColor] pre-seed with the sweat and treacle of ultra-sweet milk");
			if(pc.cockTotal() > 1) output(", the moistening of her breedable body made easier thanks to " + (pc.cockTotal() > 2 ? "all ":"") + "your otherwise uselessly flopping cock" + (pc.cockTotal() > 2 ? "s":"") + ".");
		}
		// Merge
		output("\n\n<i>“H-hey,”</i> the punky cat swoons, <i>“before you get started... maybe you’d like to have a drink?”</i>");
		output("\n\nTo your mind, all but drowned in the need to fuck, breed, and fuck again, the question almost doesn’t register. <i>“If you get a good drink, you’ll be <i>more</i> than ready to show me who belongs to who. I guarantee it...”</i> she purrs, letting your throbbing cock slide free. The milk flowing from her chest gleams in the light, forcing you to come to a decision.");
		if(pc.WQ() < 40) output(" Stars, she knows her body better than you do, obviously! A quick drink, more fuel for the fire, and you’ll take this kitten to pound town! What could go wrong?");
		else output(" In this brief reprieve, it’s abundantly clear that her milk has gotten you hornier than usual. If you drink that... Well, what does it matter? You’ll just get hornier, what’s the worst that could happen?");
	}
	//[Drink] [Don’t Drink]
	processTime(15);
	pc.lust(50);
	clearMenu();
	addButton(0,"Drink",drinkDatCatMilk,x,"Drink","What’s a little refreshment before the main course?");
	addButton(1,"Don’t Drink",dontDrinkAtTheKittyWell,x,"Don’t Drink","Nah... Madam Titty Kitty’s milk would just get in the way of a good fuck.");
}

//[Drink]
// Tooltip: What’s a little refreshment before the main course?
public function drinkDatCatMilk(x:int):void
{
	clearOutput();
	showPunkSecOp(true);
	author("William");
	var y:int = -1;
	if(pc.cockTotal() > 1)
	{
		y = pc.cockThatFits(enemy.analCapacity());
		if(y == x) y = pc.cockThatFits2(enemy.analCapacity());
		if(y == x) y < 0;
	}
	if(flags["PUNKMILK_DRANK"] == undefined) output("No way you’re passing on that opportunity.");
	else output("You know what you’re getting into, but the chemical rush is far too good to pass up.");
	output(" You smile carefree as you move to the cyber-kitty’s modded nipple... You wrap your [pc.lipsChaste] around her delectable teat and <i>suck</i>. Your cheeks hollow and your mouth purses as mouth wateringly sweet milk floods your maw; a mind-blowing flavor is absorbed into your gums and, seemingly, throughout your entire body before you’ve even quaffed it. After swallowing, you gasp, your vision blurs... and you suck <i>harder</i> than before. Void, fuck, damn, it tastes <i>wonderful</i>! A firm, gentle hand ");
	if(pc.hasLongEars()) output("caresses your [pc.ears]");
	else if(pc.hasHair()) output("runs through your [pc.hair]");
	else output("runs over your scalp");
	output(", urging you accept more of this bounty.");
	output("\n\nAfter the second gulp, you feel as though you’ve been wreathed in lustful fire. You grasp ineffectively against your body, every working receptor numb and <i>burning</i>. It’s like every cluster of nerves within have been consumed in a wildfire of inexpressible desire. Blissfully overclocked by her modded milk, she clutches your head closer, subduing you with yet another batch of hand-milked cream. One thing you <i>do</i> feel, submerged in this viscous wave of lactic-induced arousal, is the hand around your [pc.cock " + x + "], pumping your impossibly rigid cock with just enough tease that it feels like your length and girth are expanding following every thumping heartbeat.");

	// PC cock small <=6
	if(pc.cocks[x].cLength() < 7) output("\n\n<i>“Not doing so hot down there, huh?”</i> she whispers, commenting on your [pc.cockNounSimple " + x + "]. <i>“That’s fine. I’ve got an adaptable pussy, and a few new modifications that a good little assistant like you can help with,”</i> the pirate murmurs sweetly, ringing your [pc.cockHead " + x + "] with her thumb and index finger. <i>“Besides, a little modesty goes a long way. A shame those oversized rabbits don’t know the meaning of the word.”</i>");
	// PC cock big >=7
	else if(pc.cocks[x].cLength() < 12) output("\n\n<i>“Nice package, [pc.boyGirl]. Just the size I was looking for to test a few new modifications,”</i> the security cat purrs, jerking and pumping with focus on your [pc.cockHead " + x + "]. <i>“Now that I’ve got you right where I want you, you’re going to be a good, loyal assistant, right?”</i>");
	// PC cock bigger >=12
	else if(pc.cocks[x].cLength() < 18) output("\n\n<i>“O-ho... That’s quite an endowment you’ve got there, big [pc.boyGirl]!”</i> Two lissome hands wrap securely around your [pc.cockHead " + x + "], palms rubbing around the crown of your [pc.cockType " + x + "] mast. <i>“This is ideal... And you’re even bigger than those dimwitted fuckbunnies. <i>You</i> will make a perfect assistant.”</i>");
	// PC cock biggest >=18
	else output("\n\n<i>“Ha, shit, I thought you were big before, but you just keep growing don’t you? Now this... Oh yes, you’re going to be an <i>excellent</i> assistant!”</i> The catgirl squeals as your [pc.cockHeads] throb" + (pc.cockTotal() == 1 ? "s":"") + " under her dual touch. Her insatiable molestations soon pacify you. <i>“Ready to start?”</i>");
	// Merge
	output("\n\nYou pull back, groaning dully, staring at the pirate whose predatory fangs are bared to your sweat-dotted face. ");
	//punkHPLoss: 
	if(pc.HP() <= 1) output("<i>“See? I knew this is what you wanted.”</i>");
	else output("<i>“That’s the look I was waiting for!”</i>");
	output(" She grips your shoulders and insistently pushes you onto your back. The giggling pirate clamors atop your shudderingly hot and drooling form. Her long, oh-so flexible tongue flitters out, descending and collecting all the spit decorating your [pc.face], before worming its way to your [pc.cocks], crushed under her slimy robo-slit and between her [enemy.skinColor]-skinned thighs. From there, she gives an adoring lick to [pc.eachCockHead]" + (pc.hasVagina() ? ", and even your [pc.clits]":"") + ".");
	// PC big clits
	if(pc.totalClits() > 0 && pc.clitLength > 3)
	{
		output("\n\nYou cry out deliriously when your oversized clit" + (pc.totalClits() > 1 ? "s are":" is") + " stimulated in equal measure, the arcs of lightning-like pleasure making you spread eagle - or attempt to - when her tongue is able to hug " + (pc.totalClits() == 1 ? "it":"them") + " like a glove" + (pc.clitLength > 5 ? ", jerking the gratuitous flesh like any other cock":"") + ".");
	}
	output("\n\nIn your stupor, you grasp and babble for something to hold on to, feeling like your [pc.balls] " + (pc.balls == 1 ? "is":"are") + " about to explode, to say nothing of your pre-spewing [pc.cocksLight] that feel" + (pc.cockTotal() == 1 ? "s":"") + " fat, swollen, and in dire need of release." + (pc.hasVagina() && pc.wettestVaginalWetness() > 2 ? " A puddle of femslime pours out from your [pc.pussies], pooling beneath your [pc.legOrLegs] - Three fingers thrust in your cunt post-orgasm for good measure.":""));
	output("\n\n<i>“Aw, can’t handle the pressure?”</i> The buxom pirate rubs her artificial cunt against your ");
	if(pc.hasKnot(x)) output("knot");
	else if(pc.hasSheath(x)) output("sheath");
	else output("base");
	output(", her clit... Woah. Last time you looked at her clit, it was as big as a nut, but now it’s more like a pseudo-cock of profoundly sensitive flesh frotting against your [pc.cock " + x + "]." + (pc.cockTotal() > 1 ? " <i>“I’m glad you have more than one, cute stuff, I’ll give you some points for preparation. I quite like when my assistants are </i>packed<i>!”</i>":"") + " Her teasing hand eases out several ropes of pearly pre that sloughs " + (pc.cocks[x].cLength() > 15 && pc.biggestTitSize() >= 1 ? "between your tits and ":"") + "on your [pc.belly].");
	output("\n\nSitting upright, the domineering kaithrit cups one jiggling tit, squirting you with more lust inducing milk. ");
	if(pc.libido() <= 33) output("You flinch and try to keep more from sliding down your throat, but the spatter on your [pc.lipsChaste] produces a similar effect.");
	else if(pc.libido() <= 66) output("You mumble happily, parting your [pc.lips] for the rain of savory tit-cream.");
	else output("You squeal in happiness, " + (pc.biggestTitSize() >= 1 ? "squeezing your own [pc.breasts]":"pinching your [pc.nipples]") + " as you make an earnest effort to catch everything, even using your fingers to wipe up what lands outside your accepting mouth.");

	output("\n\nWith ");
	if(pc.cockTotal() == 1) output("your cock in hand");
	else if(pc.cockTotal() > 2) output("your cocks smushed together");
	else output("two cocks in hand");
	output(", the cyber-kitty lifts her hyper-feminine body and aligns your [pc.cock " + x + "] with her pussy, letting her torrid precipitations finish your lubrication.");
	if(pc.cockTotal() > 1) output(" She wraps her fuzzy, prehensile tails around " + (pc.cockTotal() == 2 ? "your second cock":"one of your extra cocks") + ", guiding it between her marvelously thick ass cheeks.");
	output(" <i>“Look up here,”</i> she calls, stroking your cheek. You do so, meeting her [enemy.eyeColor] eyes as best you can. <i>“Now, that’s enough foreplay. Let’s begin!”</i>");
	output("\n\nYour limbs buck and spasm in the searing heat of rut; your chest heaves in torturous relief that the voluptuous pirate is finally starting! Your [pc.cockHead " + x + "] prods against the syrupy folds of her augmented gash, a wave of girlcum rushing over it. Without your [pc.cockNounSimple " + x + "]’s input, her vagina widens on its own. You’re eased in at the pirate’s frictionous pace in defiance of your impatient thrusts. And the alien feel of her sweltering, synthetic slit, something you expected to be colder, clenches red-hot around every inch of your cock in ways you wouldn’t have thought possible. The muscles of her cunt impress upon your manhood methodically, not wantonly, and as you sink further into her artificial holster, you loose a feral roar, squeezing her thighs and clit with the same strength her erotically undulating tunnel applies to you.");
	pc.cockChange();

	output("\n\n<i>“Ooh! T-t-that’s...”</i> the kaithrit slumps forward");
	if(pc.cockTotal() > 1) output(", using her tails to rub your second cock against her divine ass" + (pc.cockTotal() > 2 ? ", her fat, expanded clit grinding against your third":""));
	output(".");
	if(pc.cockVolume(x) <= enemy.vaginalCapacity(0)) output(" <i>“Good fit, cutie, I’m learning a lot about you already.”</i>");
	else output(" <i>“Tight fit... But oh my, I can feel everything... As if you’re a part of me...”</i>");
	output("\n\nYou can see the sparks of incredible concentration in her feline eyes, and following her subtle facial tics, you feel your [pc.cock " + x + "] <i>assaulted</i> in ways that no normal pussy could manage. It’s more than a glove molding itself to your [pc.cockType " + x + "] shape, it’s a biocybernetic organism, and its electrons are firing at peak efficiency. Every light bounce inside your needily throbbing dick, every breath you take, is met with a massage-like pleasure that leaves you panting and begging for more of its muscular cock-grinding.");
	output("\n\nHolding your [pc.arms] for support, she rides you leisurely, taking her time on the top of your pole. You try to thrust back, but as if anticipating your impatience, your [pc.cockHead " + x + "] rebounds off her sealing canal, blocking you from taking ground you’ve yet to be given while also trapping you in its molten confines. In response to your libidinous temerity, your juice-slathered cock is pulverized from the infinite directions of augmented kaithrit cunt, demonstrating its chastity function all too well. <i>“Anxious, are you? That’ll pass, sweetie. Besides, you’re all mine right now,”</i> the slutty technophile coos. <i>“The treat I’ve given you will keep you going for as long as you’re needed.”</i>");
	output("\n\nHer loose smile is almost a challenge to you now, to take back control... somehow." + (pc.inRut() ? " It’s so fucking hard to stay rational; you were in a state of rut before you found her, but that damned milk is making it <i>so much harder</i>... You’ve got to fuck her so badly, you can’t afford to stay under her when you’ve got loads that need pumped in her!":""));
	output("\n\nShe teases your [pc.cockHead " + x + "], her walls clamping down on your cum-tube from top to bottom, preventing even the tiniest drop of pre from emerging. A soundless scream surges up your throat, and you half-whine under her authoritative constraint, feeling the pressure building as a pocket of pre fights against her and your body, only concerned with its own existence. <i>“Going to sit still now? Be a good [pc.boyGirl]? Or do I need to put the restraint goggles on you?”</i>");
	// PC bimbo
	if(pc.isBimbo()) output("\n\n<i>“Yes! Yes! I’m a good girl! I’ll totally behave, I promise!”</i> you fuck-drunkenly giggle behind half-lidded eyes.");
	// PC bro
	else if(pc.isBro()) output("\n\n<i>“I understand. You lead, I’ll follow, it’s your show...”</i> you murmur in assent, a lopsided smile on your fuckdrunk face.");
	// PC kind
	else if(pc.isNice()) output("\n\n<i>“I promise... I’ll be a good [pc.boyGirl],”</i> you hoarsely say, eyeing her sputtering tits.");
	// PC misch
	else if(pc.isMischievous()) output("\n\n<i>“I... I think that’s a good idea...”</i> you mutter, an eye on her sputtering tits. <i>For now</i>, you muse.");
	// PC hard: 
	else output("\n\nGrowling and making another futile attempt, you tell her what she wants to hear: <i>“Yes...”</i>");
	// Merge
	output("\n\n<i>“Oh, good. Although, there’s an idea for the future...”</i> she simpers, falling down just a bit more as she resumes her previous pace... An agonizingly slow pace leaving you yearning. Her body wants to pull you deeper, but her mind is stubbornly resisting your cock! When her breathtaking boobs leak above your face... <b>That’s it!</b>");
	output("\n\nWith a surge of energy, you reach up and pull her down, taking her intoxicating tit in mouth again with a plan in mind. <i>“There, see? Now that we’ve worked out where you <i>really</i> belong, let’s urrgkk-!!”</i>");
	output("\n\nBefore the presumptuous kitten can finish her train of thought, you derail it. You about headbutt her with the speed of your kiss, forcing her own milk upon her. Taken completely by surprise, she ends up hooked on her own supply; the shock of it all smashes her self-control to atoms, and your cock glides all the way through her confused cunt, [pc.cockHeadNounSimple " + x + "] battering against her womb in the most halting feeling of pleasure you’ve had since this started!");
	output("\n\nThe kaithrit SecOp screams in pleasure, feebly grappling with her jostling tits. Hyperventilating, she slumps onto your chest" + (pc.biggestTitSize() >= 1 ? ", docking with your [pc.breasts] between wild molestations":"") + ". <i>“Oohhhh, you cheeky- little...”</i> A shrill, cat-like whimper erases her cool, collected facade; her voice fades into sibilant, body rumbling purrs.");
	output("\n\nNow in control of this sexcapade, you roll over on top of the insensate kaithrit, mauling her high quality bosom and spreading her legs nice and wide, busily thrusting her into the ground with every gyration of your [pc.hips].");
	// PC bimbo
	if(pc.isBimbo()) output("\n\nGiggling, you huskily taunt her: <i>“I belong deep inside and right up here, babe! Let’s get to that stress test!”</i>");
	// PC bro
	else if(pc.isBro()) output("\n\n<i>“We’ve worked out the details just fine, hun,”</i> you nod sagely, ready to start a stress test of your own.");
	// PC kind
	else if(pc.isNice()) output("\n\n<i>“What was it you said... Something about being a good assistant?”</i> you breathily ask, cupping her pussy lovingly. <i>“Let’s move on to that. I’ve got a lot of energy stored up...”</i>");
	// PC misch
	else if(pc.isMischievous()) output("\n\n<i>“I think you wanted that to happen. Now, what was that about helping you with a few <i>tests</i>?”</i> You punctuate the last word by slapping her ass.");
	// PC hard
	else output("\n\n<i>“Alright, bitch,”</i> you scowl, <i>“let’s put the ‘stress’ in those tests of yours...”</i>");
	// Merge
	output("\n\nBolstered by the buxom cat’s starry-eyed submission, you hike her languid legs over your shoulders and buck your hips against her own" + (y >= 0 ? ", slamming your once useless [pc.cockNounSimple " + y + "] into her asshole as well!":".") + " The intense pleasure you derive from your all-conquering pumps washes away the previous emasculation in soothing waves. Without a rational brain to control it, her pussy doesn’t revert to a more plebeian state. In fact, its vacuumous suctions are now as vigorous and frantic as the mind once guiding it! One moment it fights to prevent your inward stroke, and the next it seals around your [pc.base " + x + "], denying any consistency.");
	output("\n\nBut that’s just fine. Even though she’s got all the cock-controlling technology a pirate’s payday can buy, it’s neither a match for how fucking horny you are nor how hard your [pc.cocks] are.");
	output("\n\n<i>“Fuck me, cutie! Pound me with everything you’ve got!”</i> For a split second of clarity, her pussy releases you just long enough for you to smash your hips into her, ramming into her womb with all the strength your over-stimulated muscles can provide. Grunting loudly, you fuck her ferociously, ignoring the vice that tries in vain to stop you; you set a pace despite the obstacles, bashing straight through the walls rather than looking for an alternative solution or playing it slow. Every time your dick punches through her contracting canal, pain-pleasured howls fill your [pc.ears].");
	output("\n\nHer tits jiggle with the intensity of a tidal wave, her head-tenna wobbling as if it were weathering a storm. Bellowing, you fall into the pirate’s embrace" + (pc.cockTotal() > 3 ? ", your extra cocks grinding between your bellies and her delicate super-clit":"") + ". You hook your arms under hers, dominantly grinding against her chest, concentrating solely on plowing her waterfalling cunt with everything you’ve got; you’re going to fuck her into the ground so hard that she’ll need new limbs to stand again!");
	output("\n\nYour savage thrusts are short, rapid, then long and powerful; your valiant [pc.cockType " + x + "] phallus enters and exits with lewder and louder smacks of sweat and femjuice. Peaking, your arousal assaults the edges of your consciousness, and knowing she’s right there with you in experiencing this groundbreaking success of an orgasm, you hug the cyber kitty as tight as you can, her tails wrapping around your waist");
	if(pc.hasVagina()) output(" as you feel [pc.eachVagina] " + (!pc.isSquirter() ? "dribble lightly":"squirt hard"));
	output(".");
	if(pc.hasKnot(x)) output("\n\nJust before climax, you slam your [pc.knot" + (y >= 0 && pc.hasKnot(y) ? "s":" "+x+" ") + "] into the kaithrit pirate, sealing her pussy" + (y >= 0 ? " and ass simultaneously":"") + ". The thought that your liquid virility isn’t going anywhere else is the last satisfying thought you need to cross the orgasmic line.");
	else output("\n\nAs your [pc.balls] prepare the first surge of cum, you slam your hips into the kaithrit pirate’s, a feral roar preceding your effortless ejaculation.");
	// PC low cum
	if(pc.cumQ() < 1000) output("\n\nHer synth-pussy makes it all too easy to achieve release, and with closed eyes you are intimately aware of the pleasant travel each rope of spurting [pc.cum] makes up from your [pc.balls] through your programmatically massaged urethra... right into the pirate’s waiting womb" + (y >= 0 ? " and colon":"") + ". You gently rock against her body, your [pc.cocks] flexing and swelling with salty deluge." + (pc.cockTotal() > 3 ? " [pc.CumVisc] [pc.cumNoun] sprays from your other dicks, warming your bellies with a helping of of [pc.cumFlavor]-flavored seed.":""));
	// PC plenty of cum
	else if(pc.cumQ() < 5000)
	{
		output("\n\nHer synthetic pussy makes every attempt to suck your ");
		if(pc.balls > 0) output("[pc.balls]");
		else output("body");
		output(" dry of [pc.cum], the rhythmic tightening against your urethra and [pc.cocksLight] seemingly programmed for maximum spunk-draining effectiveness. Your ");
		if(pc.balls > 1) output("nuts");
		else output("prostate");
		output(" clench");
		if(pc.balls <= 1) output("es and churns");
		else output(" and churn");
		output(" [pc.cumVisc] [pc.cumNoun] into the catgirl’s womb" + (y >= 0 ? " and ass":"") + ", lightly distending her belly against your own, and thanks to your gifted output, even starts backing up against the seal of your crotch" + (pc.hasKnot(x) ? " and knot":"") + ", faint amounts of [pc.cumColor] seed leaking from her well-used hole" + (pc.cockTotal() > 3 ? " where it mingles with the puddles fired off by your extra dicks":"") + ".");
	}
	// PC lots of cum
	else
	{
		output("\n\nWhether or not her womb is modded, it swells gravid with [pc.cum] like any other, her fancy pussy ensuring every copious shot rocketing from your depleting [pc.balls] finds its place inside, the rhythmic massages against your urethra ensuring maximum cum-milking efficiency. Your [pc.cocksLight] flex powerfully with every [pc.cumVisc], teeth-gritting eruption" + (y >= 0 ? ", filling her ass just the same":"") + ", and with shut eyes you can bask in the glory of every satiny pulse of ejaculation." + (pc.cockTotal() > 3 ? " Your extra cocks blow between your bellies, [pc.cumColor] spunk splattering everywhere, soon puddling with what backs up and spills out of her seed-filled bitch-hole.":""));
	}
	// Merge
	// PC not in rut
	if(!pc.inRut()) output("\n\nSighing euphorically, you push yourself up, feeling the amorous tickle in the back of your mind fading away. The feline’s eyes rolled back a long time ago, and she lies splayed and panting." + (pc.hasKnot(x) ? " You won’t be going anywhere with your knots locking you together, so you snuggle your head in her cleavage for now, hoping nobody else will stumble upon you. Her gratified purring lulls you into a relaxing nap rather quickly.":" You collapse again, exhausted from your efforts, and snuggle your head against her pillowy chest, idly hoping nobody else finds you like this. The gratified purring in her chest lulls you into a relaxing nap rather quickly."));
	// PC in rut
	else 
	{
		output("\n\nGrowling like a feral beast, you wait just a few minutes to pull ");
		if(pc.hasKnot(x)) output("your somewhat deflated knot" + (y >= 0 && pc.hasKnot(y) ? "s":"") + " out");
		else output("your [pc.cocksLight] out");
		output(", dragging a pained yelp from the feline whose eyes have rolled back. Even as she lies splayed and panting, you’re not satisfied yet, not after what her milk has done to your hyper-libidinous mind. You thrust back in her messy hole" + (y >= 0 ? "s":"") + ", ruthlessly starting round two as she mutters in abject bliss...");
	}
	//[Next]
	processTime(30);
	pc.orgasm();
	enemy.loadInCunt(pc,0);
	clearMenu();
	addButton(0,"Next",fuckDatPussiesPussyPostDrinkyDrank,x);
}

public function fuckDatPussiesPussyPostDrinkyDrank(x:int):void
{
	clearOutput();
	showPunkSecOp(true);
	author("William");
	// PC not in rut
	if(!pc.inRut()) 
	{
		output("<i>“Oof...”</i> the kaithrit sputters, alerting you of the fact that your one-eye-open nap is over. Damn shame too, these tits are executive-grade pillows...");
		output("\n\nYou withdraw your spent [pc.cocksLight] from her, and are surprised when her tongue darts out to clean " + (pc.cockTotal() == 1 ? "it":"them") + " of the sexual effluvium. <i>“Nice feature,”</i> you say. She giggles at your gratefulness, and soon you’re ready for another round!");
		output("\n\n<i>“That was an exemplary performance,”</i> she calls, gazing fondly at you as she stews in your [pc.cum]. <i>“If you can perform like that, maybe I should find you a hall pass. I could use someone like you on call.”</i>");
		output("\n\nYou disregard the comments and saunter off from her content tittering, knowing she or one of her partners will accost you again regardless of how you respond.");
		if(pc.isBimbo() || pc.isBro() || pc.libido() >= 66) output(" Shit, maybe you should have at least asked for her number...");
	}
	// PC in rut
	else
	{
		output("Your wet dreams are filled with pussies. Torrid, syrupy pussies hovering over your face, over your [pc.cocks], suspended in a space surrounded by an infinite amount of waiting holes between comically thick legs drizzling with the scent of ripe fruit begging to be bred. At a whim you see them all being plowed, fucked senseless - vivid moanings fill your head. When you reach out, you can conjure up the gorgeous partner you want. Even though you’re not moving, you are... you’re fucking one, then another, surfing on the breeder’s waves, your tired hips unceasingly thrusting back and forth, in and out of velveteen holes, silky slits...");
		output("\n\nGasping, your [pc.eyes] open, and you suck air, utterly deprived. You sit up with a deep groan and look around. The sights and smells reach you quickly. Your lower body is plastered with [pc.cum], and your kaithrit partner, lying to your side, is lying face down, also utterly painted and claimed by your [pc.cumColor] seed. The ecstatic thrill you felt before is still there, but dulled and blunt, as regrettably benign as your limp [pc.cocksLight].");
		output("\n\nYou cough and gather your things. Before you leave, the cyber-kitty sputters to life, <i>“N-N-no more...”</i> she whines. You can hear the cybernetics whirring and rattling in her body from here, pushed well past operational safety limits. Both organic and inorganic have been utterly exhausted and damn near slagged. <i>“I-I can’t go another...”</i>");
		output("\n\n<i>“Well, maybe you should think about that next time you target random people, kitty-cat!”</i> you giggle. That also hurts. <i>“Y-yeah.. Ohh... But that was an outstanding performance... for a solo act... Maybe I’ll find you a hall pass, and you can help me with a few more tests?”</i>");
		output("\n\nYou dismissively shake your head at her spunk-spattered smile, turning and heading off. You get the feeling she and her friends will be down your throat again regardless of what you say.");
		if(pc.isBimbo() || pc.isBro() || pc.libido() >= 66) output(" Shit, maybe you should have at least asked for her number...");
		pc.removeRut();
	}
	IncrementFlag("PUNKMILK_DRANK");
	processTime(30);
	output("\n\n");
	CombatManager.genericVictory();
}

//[Don’t Drink]
// Tooltip: Nah... Madam Titty Kitty’s milk would just get in the way of a good fuck.
public function dontDrinkAtTheKittyWell(x:int = 0):void
{
	clearOutput();
	showPunkSecOp(true);
	var y:int = -1;
	if(pc.cockTotal() > 1)
	{
		y = pc.cockThatFits(enemy.analCapacity());
		if(y == x) y = pc.cockThatFits2(enemy.analCapacity());
		if(y == x) y < 0;
	}
	author("William");
	if(flags["PUNKMILK_DRANK"] == undefined) output("Something about that milk doesn’t sit right with you, and you shake your head, carrying on as you were.");
	else output("You know what to expect from Cyber Punk milk, and you shake your head.");
	output(" Frowning, the ‘punk pirate withdraws, and with a predatory grin, squeezes her tits, squirting you with an ample amount of her semi-transparent cream. A ribbon of milk flies between your [pc.lipsChaste], melding with your gums and trickling down your throat, forcing a gasp from your aching lungs. A libidinous conflagration engulfs your body - the tingle you felt in your head is now a viscous layer drowning out all other needs but the desire for pure, unfettered <i>sex</i>. Your gravelly groans are as flat as the cyber-kitty’s ears.");
	output("\n\nThe effect her love-drug milk has on you is near instantaneous, but it’s noticeably gradual in how <i>hot</i> you feel right now. Your nervous system is numbed and assimilated into the all-consuming lust for pussy - sweet, juicy, and bitter pussy." + (pc.inRut() ? " You were already dying for a pussy or four to fuck and fill and fuck again, but somehow her amatory cream amplifies the savage sex drive at the controls of your brain.":""));
	output("\n\nThe pussy between the kaithrit’s legs may be cybernetic in design, but there’s no chance it wasn’t designed for your [pc.cock " + x + "] right here, right now. You lock-on to her boiling synthetic hole, balling your hands into fists, visible heat wafting from your grit teeth." + (!pc.isCrotchExposed() ? " You growl and rip off your [pc.crotchCovers] off with all speed, allowing your [pc.cocks] to leap from their lair, fat cables of of [pc.cumColor] pre-seed pouring from their ballooning tips, struggling to control your raging lusts.":"Fat cords of [pc.cumColor] pre-seed pour from [pc.eachCockHead], sizzling against the ground as you feverishly jerk yourself to full mast, growling as you seek to control your raging lusts."));
	output("\n\nSlinking forward, the cyber-kitty licks her lips, her hands swimming around your [pc.cocksLight] in systematic patterns. Her warm fingers draw a prolonged gasp from your salivating mouth as she further agitates your raging hardon" + (pc.cockTotal() > 1 ? "s":"") + ".");
	output("\n\nShe’s trying to take the lead.");
	// PC cock small <=6
	if(pc.cocks[x].cLength() < 7) output("\n\n<i>“Heh, think you can satisfy me with this size?”</i> the pirate husks. <i>“Aw, don’t worry about it. I appreciate a little modesty, those dimwitted rabbits could learn about it one of these days. I’ve got an adaptable pussy, you’ll be feeling...”</i> she leans in, <i>“all...”</i> she purrs hotly, <i>“you need to feel soon enough. So long as you behave...”</i>");
	// PC cock big >=7
	else if(pc.cocks[x].cLength() < 13) output("\n\n<i>“Good size, [pc.boyGirl]. Not too big, not too small. Not that it matters either way, my pussy will adapt and change to milk any size.”</i> The woman leans in, purring in your ear, trying to subdue you. <i>“Now that you’re ready, you’re going to behave yourself, right?”</i>");
	// PC cock bigger >=13
	else if(pc.cocks[x].cLength() < 18) output("\n\n<i>“Damn, big [pc.boyGirl], that’s a wonderful tool you’ve got there.”</i> The lissome pirate’s hands wrap around your [pc.cock " + x + "], sinking into your girth. <i>“Bigger than those rabbits. Now if you behave, I think we can get some real work done...”</i>");
	// PC cock biggest >=18
	else output("\n\n<i>“G-geez... How can you walk around with something like that?”</i> The kitten’s hand glides across your massive [pc.cockNounSimple " + x + "]. <i>“Oh well, you carried it right to me. If you behave, I’ve got a few things you can do with that cock of yours...”</i>");
	// Merge
	output("\n\n<b>BEHAVE!?</b> Who is she kidding? You’re so hard that your [pc.cocks] could knock this station out of alignment with " + (pc.cockTotal() == 1 ? "its":"their") + " burning erection" + (pc.cockTotal() > 1 ? "s":"") + ", and " + (pc.cockTotal() == 1 ? "it feels like it’s":"they feel like they’re") + " growing <i>bigger and harder</i> as the seconds tick by.");
	if(pc.balls > 0) output(" The enchanting handjob your [pc.balls] " + (pc.balls == 1 ? "receives":"receiving") + " makes matters worse. <i>Better</i>.");
	output(" Stars be damned, whatever she’s doing isn’t nearly enough to relieve you of the pressure building down there, making you feel as if you’re about to explode!");
	if(pc.hasVagina()) output(" The effect it has on your [pc.pussy], or had, was felt in the " + (!pc.isSquirter() ? "body-rumbling feminine orgasm you just had":"projectile of [pc.girlCum] that just splattered the giggling pirate") + ".");

	output("\n\nWhen you feel two hands on your shoulder blades, you shrug them off and wrestle back! Though your vision may be blurred, the intoxicating scent of cyber-cunt and the sexual overclock inflicted on you give you just enough focus - <i>and strength!</i> - to stay in control. The robo-cat yelps when you spin and force her down, falling on her like a sack of bricks. Both of your [pc.arms] wrap around her body, manhandling the hell out of her tits, squeezing those pebbly cybernips to soak your hands and the ground in tasty trick milk." + (pc.hasTongueFlag(GLOBAL.FLAG_LONG) ? " You press your your head to her back and, thanks to your endowed organ, work your [pc.tongue] around her waist, happily teasing her sensitive nips and mingle with her own augmented organ.":""));

	output("\n\nYou fall back just a bit, lowering your face into her overheated nethers where you deliver a long, succulent lick to her slightly parted pussy. The taste is... fuck, it’s phenomenal, and it sends you into the next level of overdrive! You rabidly lick up, down, and up again, nibbling on her fat button of a clit, forcing louder and louder groans from the kitty-pirate. You spread the forgiving flesh of her pussylips, drinking down the sweet fruit oozing endlessly from her heavenly folds. Your hot breaths against her cunt make her thrust that ravishing quim into your face, burrowing your [pc.tongue] between ribbed walls that squeeze like an ocean wave against your parched muscle. You tug yourself free and reassert yourself, keeping a few fingers busy down there.");
	output("\n\n<i>“Ooh, this... Did I underestimate your ability?”</i> the ponytailed slut looks back, grinning as her two puffy tails wrap possessively around your waist. <i>“But I wonder how long you can last. I think you’re - Achh!”</i>");
	output("\n\nYou smack her square on her jiggling ass, the wobbles and ripples of her [enemy.skinColor] flesh and loud, sexy yelps inflame your befuddled mind further. You smack again, again - <i>THWACK!</i> - then knead it slowly. When you squeeze her malleable globes, her reddening skin sinks easily between your fingers. There’s far too much kitty assflesh to be held by your hands alone. You mount her, getting your hands back on those sputtering melons dangling from her chest, ramming your [pc.cocks] between her quivering, palatial thighs" + (pc.cockTotal() > 1 ? " and her pillowy derriere":"") + ".");
	if(pc.cockTotal() > 3) output(" The rest of your dicks flop uselessly, wetly smacking against her legs and ass, spurting [pc.cumColor] pre all over her.");
	else if(pc.cockTotal() > 2) output(" Your extra dick smacks wetly against her shuddering legs, painting it [pc.cumColor] with pre-seed.");

	// PC bimbo
	if(pc.isBimbo()) output("\n\n<i>“Alright, sweetie! I think this... right here... Hehe!”</i> You thrust again, squealing in trembling pleasure, her thighs closing around your girth as you hump and giggle. <i>“...is where I belong! Now just you sit there and - ooohh - behave!”</i> The buxom catgirl cranes her neck, teeth burrowed in her lower lip, smirking at the giggling, half-minded slut that is you. That seductive look is meant to be a challenge, but wanton lust can be seen struggling for dominance in those widening pupils.");
	// PC bro
	else if(pc.isBro()) output("\n\n<i>“Looks like we’ve both found where we belong. Me, right on top of my feisty feline, and you, right beneath your stud,”</i> you grin, grunting loudly as you rapidly buck your hips in this intercrural foreplay. The augmented kaithrit glances at you, her fangs burrowed in her lower lip, a smirk spreading across her flush and sweating face. The expression on her face is definitely a challenge, but you can see she’s struggling to avoid surrendering to her needs. Poor thing.");
	// PC kind
	else if(pc.isNice()) output("\n\n<i>“Uhmm...”</i> you grunt, thrusting between her swaddling thighs, grinding your crotch against thick pirate ass, gently fondling and kneading her voluptuous assets with deep, stinging gasps. <i>“I think it’s fair to warn you how horny I am after that stunt of yours.”</i> Your pumps between her velveteen valleys are deliberate, doing just enough to soothe your furious erection" + (pc.cockTotal() > 1 ? "s":"") + ". <i>“Hope you’re ready for this..!”</i> The cyber-kitty giggles when she looks back to you, her fangs burrowed in her lower lip in a wide smile.");
	// PC mischievous
	else if(pc.isMischievous()) output("\n\n<i>“You know, I don’t mind that little attempt of yours, gotta do what you can to stay on top and in shape around here, right?”</i> You gasp when her plump thighs clench around your [pc.cocksLight]. <i>“But hey... Umf!”</i> You pull back and thrust in hard, making her squeak. <i>“We’re both about to get what we want and a lot more. In fact, I’m a little jealous. After I’m through with you, I think you’ll have had the real fun in this.”</i> The kaithrit woman meets your confident grin, her fangs sinking into her lower lip, a wide, challenging expression on her face. She dares you to live up to the hype, but at the same time, you can see significant effort to stay in control of her instincts.");
	// PC hard
	output("\n\nYou accentuate every thrust in the security cat’s warm leg- and ass-cleavage with a sharp smack to her jiggling rump. <i>“This is just what you wanted, isn’t it, slut?”</i> you growl, thrusting just a bit faster. <i>“You aren’t getting off easy, not after that little stunt.”</i> Moaning loudly, a wave of girl cream washing over your [pc.cocksLight], the lip-biting cyber kitty gazes at you. There’s some resistance left in her challenging eyes, but it’s giving way to overwhelming desire for more.");
	// Merge
	output("\n\nRearing back, you line your [pc.cock " + x + "] up with her pussy. The slightly puffy lips are caked in juice that’s run down to her knees, leaving an extra pair of obvious (and fragrant!) lines on her body that mark the roads other secretions walk. You rub your [pc.cockHeads] into her folds, humming in delight as her smooth skin and expanding clit fold and flex in the presence of your musky member" + (pc.cockTotal() > 1 ? "s":"") + ". Wait, expanding clit? <i>“Nice, you losing control already?”</i> you ask, slipping a few fingers around that pseudo-cock of hyper-sensitive flesh. The SecOp refuses to comment, but her body reacts appropriately.");
	output("\n\nAfter lubing [pc.eachCock] up, made difficult by her temptress hips and your vanishing self-control, you thrust inside her cyber-pussy" + (y >= 0 ? " and her ass":"") + ", intent on making " + (y < 0 ? "it":"them") + " your own.");
	pc.cockChange();
	output("\n\nImmediately you wince at the tightness of her wet cunt. You’ve only slipped a few inches and, damn, it’s like her body is fighting a battle against your dick! " + (y >= 0 ? "Fortunately, as you press your exploratory [pc.cockNounSimple " + x + "] into her ass, the barricades of sensitive nerves and spasming muscles fold to your [pc.cockHead " + x + "]. ":"") + "You pull back and thrust in a bit harder, feeling like you’ve accomplished nothing. The effect this has is far from pleasurable: it’s aggravating the hell out of your overcharged libido.");
	output("\n\n<i>“H-having trouble?”</i> the punky cat grins, moaning as you gain another inch. <i>“Are you?”</i> is your hasty response. You’re determined to get in there. And yet, as you take just a little more slathering ground, her leaky cunt constricts all around your [pc.cockHead " + x + "] so tightly and so... <i>methodically</i>. There’s no other word for how <i>alive</i> her inner walls are, how despite their nature, it feels like a million fingers pressing from infinite directions, each point of pressure minute but unbelievably effective. Your urethra is pressed and squeezed by those innumerable phantom digits, preventing even the tiniest drop of pre from spurting. Despite the intense vaginal pressure on your dick, she coaxes you further in, giving your straining cock what can be described as the ultimate massage.");
	output("\n\nBut regardless of the good that can be said, in this battle of wills, hers is getting the upper hand." + (y >= 0 ? " With your [pc.cock " + y + "] under control half-way inside, you can hardly do anything with the one in her tight butt, itself desperate to stake its claim.":""));
	output("\n\n<i>“This pussy can be used to stimulate a partner in ways that normal pussies can’t achieve. And because I can - Aaohh!”</i> the kitten’s ears fold when you reposition, growling as you struggle against her. <i>“I can control you with just a thought now that you’re in there. R-r-ready to admit defeat - <i>Ah!</i> - yet?”</i>");
	output("\n\n<b>Fuck that!</b>");
	output("\n\nYou grab her tails and lift her ass up, and your " + (y >= 0 ? "[pc.cocksLight] slip":"[pc.cock " + x + "] slips") + " in a bit deeper. You’ve still got so much more to give if you could just... get that fffffucking...");
	output("\n\nGasping loudly, the vice around your dick draws a raspy, pained breath from your lungs. You keel over her back, still squeezing roughly on her ass. She denies you and at the same time stimulates your [pc.cockType " + x + "] shaft with precisely applied strength, backing up your balls in the worst way possible. This wouldn’t be so bad if she’d just let that robo cunt do what it was made for and instead <i>milk</i> your cock! <i>“Come on stranger, I’m all for a good time, but as they say... if you can’t <b>hack</b> it, you might as well... <i>step back</i>.”</i>");
	output("\n\nUrrghhh! You whimper now, the stress becoming intolerable. For all the ground your valiant dick struggles to maintain, it’s a losing battle. You slap her ass, you jerk her oversized clit, you maul her boobs, but in this vaginal stalemate, the enemy territory continues to close in all around. The more breaths you take, the more like a snake it feels, closing around you tighter and tighter, demanding you submit.");
	if(pc.hasVagina()) output(" Even your [pc.pussies] " + (pc.totalVaginas() > 1 ? "are":"is") + " denied, the pressure on your [pc.cocksLight] making it impossible to cum whatsoever..!");
	output("\n\nYou frantically glance at the pirate’s head, noting she’s been unusually quiet the last minute. Her head is slumped and her body is undergoing its own earthquake. Her pained howls give you hope when you reposition over her: you plunge further in, so close and yet so far from hilting her.");
	output("\n\nBut the shred of pleasure you derive from making your own way inside her restores your sense of control. Your vision clears just enough to see the gratuitous puddle of milk that’s leaked from her chest, and you finally realize what you have to do. You lean down, your [pc.skinFurScales] contouring to her arched back, and run your fingers through the thickest gatherings of her cream and carry it to her mouth. Her cable-like tongue hangs from her jaw; you hurriedly swab her mouth with her own supply.");
	output("\n\n<i>“Mmmh!!”</i> she moans, squirming against you. But that does it! <i>“AhhhgHhhAAAA!”</i> she screams, letting the breath she held for so long go, and with it... her grip on you.");
	output("\n\nWith each passing second, you fall further into her kitty hole until you finally breathe your own sigh of relief: your [pc.cockHead " + x + "] bowls over her G-spot and gives its warmest, stickiest greetings to her womb, signaling its victory with a heavy pulse.");
	if(y >= 0) output(" Your extra [pc.cockNounSimple " + x + "] in her ass claims her colon as its own, fully hilted inside.");
	if(y < 0 && pc.cockTotal() == 2 || y >= 0 && pc.cockTotal() == 3) output(" Your extra dick spurts a long rope of pre not unlike a thread of cum over her leg, your [pc.balls] finally liberated of chastity mode.");
	else if(pc.cockTotal() > 2) output(" Your extra dicks spurt long ropes of pre not unlike cords of cum over her legs, your [pc.balls] finally liberated of chastity mode.");
	output("\n\nSweat dripping from your entire body - you lean down to her twitching ear, and tell her that she now belongs to you.");
	output("\n\n<i>“AwwAhaaaa!”</i> she cries ruefully, <i>“fine, fiiineeee! I give up I submit justfuckmealready!”</i>");
	output("\n\n<i>With <b>all</b> pleasure</i>. Time around you seems to hold its breath as you withdraw from her pussy, the universe waiting with bated breath as some horribly edged creature - you - overcomes its trial-by-pussy and <i>earns</i> this fuck. With your [pc.cockHeads " + x + "] just barely inside her now berserk cunny" + (y >= 0 ? " and stretched ass":"") + ", you laugh loudly as you conquer this cat, slamming your [pc.cocksLight] into her so hard that her cervix spreads and her whole body crashes to the ground. The confused synth-pussy you pound retains its vacuumous strength, vigorously sucking on your dick like a throat, its servos firing in all the right places to masterfully administer pleasure to your cock.");
	output("\n\nThe floodgates broken, you froth at the mouth in your haze of rut as you mercilessly plow her, pulling on her arms as you do. She screams praises and encouragements, urging you on and on; conjuring up all the strength in your over-stimulated and aching muscles, you rise to the occasion and the pace of a jackhammer. Her cunt seals its red-hot muscles to block your pleasurable path, but you carry on without regard, your [pc.cockHead " + x + "] punching right through her clenching canals.");
	output("\n\nThe antenna on her head and her super-tongue wobble, the babbling ‘punk’s fingers crimp. Glancing down, you see her tongue weaving around her hyper-engorged clit and wrapping taut and firm around your [pc.cocksLight] in an exotic and incredibly arousing display ");
	output("that carries on to your ");
	if(pc.balls > 0) output("[pc.balls]");
	if(pc.balls > 0 && pc.hasVagina()) output(" and ");
	if(pc.hasVagina()) output("[pc.vaginas]");
	if(pc.balls == 0 && !pc.hasVagina()) output("[pc.asshole]");
	output(". When you bury your prick" + (y >= 0 ? "s":"") + " inside, her tongue follows you inside.");
	output("\n\nYour powerful, rhythmic pumps receive the full cooperation of her augmented body; your thumping thrusts go from lengthy to short, slow to swift. Your [pc.cockType " + x + "] phallus glides in and slides out of her flooding snatch, the obscene sounds of dripping femjuice, overflowing pre, and waterfalling sweat reaching unrecorded volumes and vulgarity. When you slam your hips against hers one last time" + (pc.balls > 0 ? ", your [pc.balls] tightening just beneath her dominated twat":"") + ", you bellow and yank her up as you lie on your back.");
	output("\n\n<i>“Wha-!”</i> the pirate squeals, but with no strength in her limbs, she plunges down on your [pc.cocks]");
	if(pc.hasKnot(x))
	{
		output(", your " + (y >= 0 && pc.hasKnot(y) ? "[pc.knots]":"[pc.knot " + x + "]") + " spreading her hole" + (y >= 0 ? "s":"") + " past their limit and ensuring maximum breeding potential. The strain on her backside sounds very much to her liking");
	}
	output("! Fully inserted, the first rope of [pc.cum] launches through your dick with such ease and such intimate, detailed sensation that you blissfully shudder in this mind-shattering climax" + (pc.hasVagina() ? ", one that [pc.eachVagina] sympathetically add to more from the inside than out":"") + ".");

	var freecocks:Number = pc.cockTotal() - 1;
	if(y >= 0) freecocks--;
	// PC low cum
	if(pc.cumQ() < 1000)
	{
		output("\n\n[pc.CumVisc] [pc.cumNoun] spurts. and spurts, and spurts into the cyber-kitty’s stretched womb, her synth-pussy programmatically ensuring maximum [pc.sack] draining efficiency. Your [pc.cum] is delivered to the door by your swollen cumslit, and every throbbing, pulsing ejaculation vibrates her body and yours." + (y >= 0 ? " Your second [pc.cockNounSimple " + x + "], lodged deep in her ass, squirms against your first through the nerves separating them.":""));
		if(freecocks > 0) output("Your other " + (freecocks == 1 ? "member":"[pc.cocksLight]") + ", without " + (freecocks == 1 ? "a hole of its own, sadly paints":"holes of their own, sadly paint") + " part of your body or hers with [pc.cumColor] seed.");
	}
	// PC plenty of cum
	else if(pc.cumQ() < 10000)
	{
		output("\n\nThe kaithrit’s synth-pussy demonstrates its expertise at milking your " + (pc.balls > 0 ? "[pc.balls]":"body") + " of every drop of [pc.cumColor] spunk. As you fill her spread womb" + (y >= 0 ? " and spasming ass":"") + " with load after thick load of [pc.cumVisc] [pc.cumNoun], the indescribable sensation of a million gentle prods and palpations against your urethra make every tactile, voluminous ejaculation an exquisitely soft and memorable one. Her belly noticeably swells with the sheer amount your pour into her womb" + (y >= 0 ? " and colon both":"") + ".");
		if(freecocks > 0) output("Your extra " + (freecocks == 1 ? "member":"[pc.cocksLight]") + ", limply hanging outside, pitifully shoot" + (freecocks == 1 ? "s":"") + " over her butt and your body.");
	}
	// PC lots of cum
	else
	{
		output("\n\nYou have no idea if this techno-feline’s womb is modded, but it’s sure swelling gravid with [pc.cum] like any other would. Her spunk-sucking pussy expertly massages and and palpates your urethra, making every powerful ejaculation an exquisitely pleasurable and unforgettable experience as you pump her womb" + (y >= 0 ? " and colon":"") + " full and fuller with [pc.cumVisc] [pc.cumNoun].");
		if(pc.hasKnot(x)) output(" You’re bloating her so much that with each pulse and throb, [pc.cumColor] seed begins to leak out around your knot" + (y >= 0 && pc.hasKnot(y) ? "s":"") + ".");
		if(freecocks > 0) output(" Your unslotted " + (freecocks == 1 ? "member helplessly sprays":"[pc.cocksLight] helplessly spray") + " [pc.cum] all over her back and yourself.");
	}
	// Merge
	// PC not in rut
	if(!pc.inRut()) 
	{
		output("\n\nThe pirate cat falls on to your [pc.chest], ecstasy-ridden head landing to the side of yours. Her eyes rolled back some time ago, and now she simply lies splayed and panting in your embrace. Thankfully, the amorous tingle in the back of your head is gone. ");
		if(pc.hasKnot(x)) output("So long as your " + (pc.hasKnot(y) ? "[pc.knots]":"[pc.knot " + x + "]") + " are inflated, you won’t be going anywhere, especially not as you’re still cumming a bit! You get your hands around her " + (pc.cumQ() >= 10000 ? "gravid ":"") + "belly and hold tight, hoping nobody else’ll stumble upon your tryst. Her gratified purring helps you catch some shut-eye in the meantime.");
		else output("With a big, sexy cat girl on top of you and your [pc.cocksLight] deflating warmly inside her, you have little strength after your monumental orgasm. Wrapping your hands around her " + (pc.cumQ() >= 10000 ? "gravid ":"") + "belly, you snuggle up and catch some peaceful shut-eye.");
	}
	// PC in rut
	else
	{
		output("\n\nGroaning and half-whimpering, you roll over on the augmented pirate and tug your ");
		if(pc.hasKnot(x)) output("barely deflated " + (pc.hasKnot(y) ? "[pc.knots]":"[pc.knot " + x + "]"));
		else output("spent " + (y >= 0 ? "[pc.cocksLight]":"[pc.cock" + x + "]"));
		output(" from her. A hoarse moan follows as you gaze down, still overwhelmingly hot, the need inside yet to be quenched. Your [pc.cock " + x + "] is still pulsing, and when you close your eyes, it’s a body-rattling beat that makes you shudder in abject awareness of your deific needs. You plunge inside her messy hole" + (y >= 0 ? "s":"") + " again, beginning round two with the blissed out kitten...");
	}
	//[Next]
	processTime(30);
	pc.orgasm();
	enemy.loadInCunt(pc,0);
	clearMenu();
	addButton(0,"Next",dontDrinkTheCatMilkPart2,[x,y]);
}


public function dontDrinkTheCatMilkPart2(args:Array):void
{
	clearOutput();
	showPunkSecOp(true);
	author("William");
	var x:int = args[0];
	var y:int = args[1];
	// PC not in rut
	if(!pc.inRut())
	{
		output("<i>“Gahh...”</i> the kaithrit sputters, rousing you from your one-eye-open nap. <i>“Where...”</i> She looks to the left, meeting your [pc.eyes] with flicking ears. <i>“Oh.”</i>");
		output("\n\n<i>“Yeah, ‘oh’,”</i> you grin. ");
		if(pc.isBimbo()) output("<i>“Do I get a kiss, mmmhh?”</i>");
		else if(pc.isBro()) output("<i>“Ready for another round?”</i>");
		else if(pc.isNice()) output("<i>“Hey yourself.”</i>");
		else if(pc.isMischievous()) output("<i>“You disappointed?”</i>");
		else output("<i>“For your sake, I hope you’re not going to start something.”</i>");

		output("\n\nShe simply leans in and gives you a kiss on the cheek. The catgirl kips up with inhuman agility and slowly disentangles from you, sliding your [pc.cocksLight] from her pussy" + (y >= 0 ? " and ass":"") + ". <i>“That was an excellent performance, whoever you are,”</i> the woman looks down as you yourself begin to stand. <i>“Perhaps I should find you a hall pass? I could use an eager [pc.boyGirl] like you around.”</i>");
		output("\n\nYou disregard her comments. She folds her arms, already back to the way she was before your encounter, waving fondly as you leave. You know that no matter what you say, it wouldn’t change what is bound to happen again in the future.");
		if(pc.isBimbo() || pc.isBro() || pc.libido() >= 66) output(" Shit, maybe you should have at least asked for her number...");
	}
	// PC in rut
	else
	{
		output("You passed out a while ago. Time doesn’t matter, not here in this dreamland of unfettered sex. Your body may have stopped breeding, but your mind is still at it. Even here on this euphoric cloud you still fuck. Legs part all around you, exposing their juice-slathered pussies to your inspection. At a whim you have another gorgeous partner to fuck senseless, your " + (pc.balls > 0 ? "[pc.balls]":"body") + " producing an endless amount of [pc.cum] to help you knock up every comer. You’ve got this down to a science, one minute and one-hundred thrusts for each sexy girl that comes your way. You pound, you slam, and you-");
		output("\n\n<i>Breathe</i>.");
		output("\n\nYou awaken with a painful gasp, shooting up and clutching your buzzing head. You frantically try to determine how much time has passed, but it’s futile. What you can see is your body absolutely caked in [pc.cum]. To your right... the punky cat who tried to get the best of you is lying languid, panting for air. She is also utterly painted in your [pc.cumVisc] [pc.cumColor] seed, thoroughly claimed.");
		output("\n\nYou cough, sore throat and all, as you gather yourself. The cyber-kitty sputters to life, whining, <i>“Oohh... please, n-no more... I can’t go again...”</i> From here, you can hear the cybernetics rattling violently in her modified frame, organic and inorganic parts both utterly exhausted and pushed well past operational safety limits.");
		output("\n\n<i>“I think next time I’m in heat, I’ll come find you again,”</i> you say with a giggle. That also hurts.");
		output("\n\n<i>“Y-yeah... You could help me with some other tests in the future. M-maybe I should find you a hall pass?”</i> the stammering kitten flashes you a spunk-spattered smile. <i>“You did unspeakably well... for a solo pirate.”</i>");
		output("\n\nYou shake your head and move on. You know that regardless of what you say, she and her friends will be down your throat again.");
		if(pc.isBimbo() || pc.isBro() || pc.libido() >= 66) output(" Shit, maybe you should have at least asked for her number...");
	}
	processTime(15);
	output("\n\n");
	CombatManager.genericVictory();
}

//Get Licked - Either
//Force the kitty-[enemy.boyGirl] to apologize with [enemy.hisHer] tongue.
public function getLickedBySecop(x:int):void
{
	clearOutput();
	showPunkSecOp(true);
	author("Fenoxo");
	//Bimbo
	if(pc.isBimbo()) output("You giggle at the silly, sexy cat-[enemy.girlBoy]. <i>“Shhh, let’s just have some fun, okay? Don’t think about all that other stuff, and you just worry about my pussy, ‘kay?”</i>");
	//Bro
	else if(pc.isBro()) output("You grin and at at your crotch. <i>“Yeah you can lick...”</i>");
	//Nice/Misch
	else if(pc.isNice() || pc.isMischievous()) output("\n\n<i>“Since you offered" + (pc.isMischievous() ? " sooo generously":"") + "... I do have something you and your tongue can take care of.”</i>");
	//Hard
	else output("You chuckle. <i>“Since you’re on your knees, why don’t you put that wiggling tongue of yours to work on my pussy.”</i>");
	//Merge
	//Pussy exposed - no new PG
	if(!pc.isCrotchExposed()) output(" You reach down to your proudly displayed slit" + (pc.totalVaginas() > 1 ? "s":"") + ", sliding your palm gently across the lusty mound" + (pc.totalVaginas() > 1 ? "s":"") + " before slowly spreading " + (pc.totalVaginas() == 1 ? "it":"one") + " open with two fingers to reveal the [pc.vaginaColor " + x + "] interior.");
	//Not exposed - no new pg
	else output(" You peel out of your clothing to reveal the contours of your [pc.vaginas]" + (pc.hasCock() ? " and [pc.cocks], though you keep your fingers squarely around the former. Dicks are fun, but you’ve got a serious desire to feel this kitty’s thick, wet tongue.":". With a slow, teasing gesture, you reach down to spread " + (pc.totalVaginas() == 1 ? "your lips":"one’s lips") + " wide, revealing your [pc.vaginaColor " + x + "] interior."));
	//Moirge
	//HP win
	if(enemy.HP() <= 1)
	{
		output("\n\nThe cybernetic cat-" + enemy.mf("guy","girl") + " nods all too seriously. <i>“Okay...”</i> [enemy.HeShe] crawls forward unsteadily" + (enemy.biggestTitSize() >= 2 ? ", nearly tipping over from the weight of her own jiggling tits":"") + ". [enemy.HisHer] visor shuts off to give [enemy.himHer] a better view, and [enemy.hisHer] wide, feline eyes drink in the sight of your " + (pc.vaginas[x].wetness() < 3 ? "increasingly lusty":"soaking") + " delta. The slits of [enemy.hisHer] pupils widen in unexpected desire. <i>“That’s... a really nice pussy.”</i> [enemy.HeShe] licks [enemy.hisHer] lips" + (enemy.hasCock() ? ", the distention in the crotch of [enemy.hisHer] suit engorging until it splits apart to reveal the silvery length of [enemy.hisHer] cybernetic breeding tool.":", the silver of her suit splitting apart to reveal two hard nipples."));
	}
	//Lust
	else
	{
		output("\n\nThe cybernetic cat-" + enemy.mf("guy","girl") + " scrabbles forward madly" + (pc.biggestTitSize() >= 2 ? ", her heavy tits jiggling and bouncing as her armored suit pulls back to expose them":"") + ". <i>“Yessss!”</i> [enemy.HeShe] shuts down [enemy.hisHer] holovisor for a better view, allowing [enemy.hisHer] lust-dilated eyes to drink in the sight of your " + (pc.vaginas[x].wetness() < 3 ? "increasingly lusty":"soaking") + " delta. <i>“I am going to eat the fuck out of this.”</i> [enemy.HeShe] licks [enemy.hisHer] lips, drooling slightly." + (enemy.hasCock() ? " The corded silver of [enemy.hisHer] armored suit splits at the crotch to reveal an equally reflective piece of cybernetic genitalia - all thirteen inches of throbbing robo-cock.":"") + " A too-pleased giggle announces just how happy this turn of events has made [enemy.himHer]. <i>“You have the prettiest pussy on station.”</i>");
	}
	//Merge
	output("\n\n" + (enemy.lust() >= enemy.lustMax() ? "<i>“Thank you.”</i>":"Flatterer.") + " You can wait no longer. Grabbing [enemy.himHer] by the back of the head, you push the kaithrit’s face into your [pc.vagina " + x + "], smashing [enemy.hisHer] cutely twitching nose into [pc.oneClit] and [enemy.hisHer] cheeks into your [pc.thighs]. [enemy.HisHer] lips are already wet, though whether [enemy.heShe] kept them that way for your pleasure or merely accepted a gift from your own ");
	if(pc.wetness[x].wetness() < 3) output("wonderfully moist");
	else if(pc.wetness[x].wetness() < 4) output("wonderfully wet");
	else if(pc.wetness[x].wetness() < 5) output("beautifully drenched");
	else output("wonderfully drooling");
	output(" cunt remains unclear. You hold [enemy.himHer] in a two-handed grip, careful of [enemy.hisHer] cybernetic antenna, and rock [enemy.himHer] back and forth, your [pc.hips] rolling, sending sparks of delightfully dominant pleasure coursing up your spine.");
	output("\n\nA spear of warm flesh shatters your concentration and coordination with a single thrust. The cyber-kitty clearly has no qualms about going tongue deep. As your hands fall away, [enemy.heShe] presses forward all the harder, pushing inch after inch deeper. The muscular organ is surprisingly strong and coordinated. It burrows and twirls with ease. Sometimes it undulates in horizontal waves that leave your [pc.vagina " + x + "] quivering and your heart hammering. With how deep it is and how it casually manhandles your passage, you feel almost like a marionette, twitching on its strings.");
	//Puffy pussy -Andor equine?
	if(pc.hasPlumpPussy(x) || pc.vaginas[x].type == GLOBAL.TYPE_EQUINE)
	{
		output("\n\nYour insides aren’t the only place your cunt-hungry kitten tends to either. [enemy.HisHer] hands come to rest at either side of [enemy.hisHer] face, thumbs on the chubby exterior of your outer lips. With a pussy as fat and swollen as yours, [enemy.heShe] can all but lose [enemy.hisHer] face on the inside while massaging the exterior portions with [enemy.hisHer] thumbs. The digits slip and slide across your rubbery, hyper-engorged flesh as if they can’t quite believe there’s that much cunt to play with, that much pussy to adore, and then they settle into place, pressing and rubbing in small, blissful circles.");
		output("\n\nEvery caress produces a sopping wet squelch.");
	}
	//Big Clit
	if(pc.clitLength >= 2)
	{
		output("\n\nYour [pc.clit] isn’t ignored either" + (pc.totalClits() > 1 ? " (at least, not all of them)":"") + ". When your cat-eared lover thrusts [enemy.hisHer] tongue, [enemy.hisHer] head rocks back, dragging [enemy.hisHer] nose along the underside. You clench in delight as you realize that no only is [enemy.heShe] fucking your slit - he’s grinding [enemy.hisHer] face into your oversized button, spreading your fragrant juices further and further across [enemy.hisHer] eager, cunt-drunk face.");
		//Cocksize clit (added on)
		if(pc.clitLength >= 5) output("\n\nYou nearly cum when a hand reaches up to curl around your oversized feminine anatomy. The too-sensitive clitoral flesh was never meant to be so large or stimulated so strongly. [enemy.HisHer] fur is like a silky sleeve for your throbbing girl-boner. You’d be drooling cum into [enemy.hisHer] palm if it were a dick" + (pc.hasCock() ? ". As it is, that’s happening a bit higher":"") + ". The gigantic love-button strains and flexes, but [enemy.heShe] expertly controls it, licking all the while. The security operative knows [enemy.hisHer] way around your anatomy, and your body loves [enemy.himHer] for it.");
	}
	//Balls
	if(pc.balls > 0)
	{
		output("\n\nStill slurping and sucking, the thirsty kaithrit shows no signs of caring that your [pc.sack] is resting on [enemy.hisHer] head, not even when your [pc.balls] clench or twitch. [enemy.HeShe] looks so silly, ");
		if(pc.ballDiameter() < 4) output("wearing " + (pc.balls == 1 ? "it":"them") + " as a hat");
		else if(pc.ballDiameter() < 7) output("half-buried in ball" + (pc.balls > 1 ? "s":""));
		else if(pc.ballDiameter() < 10) output("nearly buried in ball" + (pc.balls > 1 ? "s":""));
		else output("buried in ball" + (pc.balls > 1 ? "s":""));
		output(".");
	}
	//Cock - no new PG if balls.
	if(pc.hasCock())
	{
		if(pc.balls == 0) output("\n\n");
		else output(" ");
		output("Your [pc.cocks], sadly, get" + (pc.cockTotal() == 1 ? "s":"") + " no such attention. " + (pc.cockTotal() == 1 ? "It twitches":"They twitch") + " all alone above, unattended by your fuzzy-eared partner. It’s only when " + (pc.cockTotal() == 1 ? "it leaks":"they leak") + " pre-cum that you finally cave in and grab hold, pumping and groaning, so turned on by the tongue’s skillful manipulations that you can’t help but masturbate.");
	}
	//Enemy lost by lust and is male
	if(enemy.lust() >= enemy.lustMax() && enemy.hasCock())
	{
		output("\n\nHeavy slapping sounds signal that something far lewder is happening by your [pc.footOrFeet]. Leaning to the side, you catch a glimpse of the kitty-boy’s feet cradling [enemy.hisHer] cock, pumping up and down it, [enemy.hisHer] toes curled tightly around [enemy.hisHer] gleaming chrome cock-head. The strokes match the pace of [enemy.hisHer] tongue perfectly, like in [enemy.hisHer] head its [enemy.hisHer] dick that’s sinking so deeply into your folds, causing you to moan with such sweet happiness.");
	}
	//Enemy lost by lust and is female
	else if(enemy.lust() >= enemy.lustMax())
	{
		output("\n\nA second set of lurid squelches signals that something just as lewd is happening by your [pc.footOrFeet]. Leaning to the side, you catch a glimpse of the kittenish woman’s incredible flexibility. She has one foot bent almost double, thrusting a few of her fluffy toes deep into her own cunt. The strokes perfectly match her tongue’s motions, like she’s substituting one limb for another. Maybe that’s why she’s so good with her tongue. She just folds herself in half and just licks herself into ecstasy.");
	}
	//Merge orgasm
	output("\n\nEverything changes when the augmented kaithrit’s tongue twists itself into a helix. Every part of your pussy is stimulated: the top, bottom, sides, and even your g-spot. What’s more, it makes you feel completely full, and it’s slowly uncoiling, widening to open you up further and further. You cry out in sudden ecstasy as it all becomes too much. With a scream of insensate bliss, you cum.");
	if(!pc.isSquirter()) output(" [pc.GirlCum] trickles into [enemy.hisHer] waiting maw and slicks [enemy.hisHer] cheeks.");
	else 
	{
		output(" [pc.GirlCum] floods [enemy.hisHer] waiting maw and bulges [enemy.hisHer] cheeks. Excess splatters across the rest of [enemy.hisHer] face until he’s glazed");
		if(pc.girlCumQ() >= 3000) output(", and you’re barely getting started. You gird [enemy.himHer] in girlish lust and leave [enemy.himHer] kneeling in a puddle of it");
		output(".");
	}
	if(pc.hasCock()) 
	{
		output(" Your [pc.cocks] squirt" + (pc.cockTotal() == 1 ? "s":"") + " sympathetically, emptying your [pc.balls] into [enemy.hisHer] hair");
		if(pc.cumQ() >= 3000) 
		{
			output(" and ");
			if(!pc.isSquirter()) output("a new");
			else output("the");
			output(" puddle");
		}
		output(".");
	}
	output("\n\nYou stumble back as your [pc.vaginas] steal" + (pc.totalVaginas() == 1 ? "s":"") + " your attention from the rest of your muscles, the long tongue swirling and twirling as it slides out, flicking droplets of passion and saliva into a airborne spray. The cat-[enemy.boyGirl] sits there stunned");
	if(enemy.lust() >= enemy.lustMax())
	{
		if(enemy.hasCock()) output(", leaking [enemy.hisHer] own cum all over [enemy.hisHer] toes");
		else if(pc.hasVagina()) output(", quivering with half her foot lodged in her quim while she cums");
	}
	else output(" for a moment before [enemy.heShe] begins to masturbate, too impassioned to hold back any longer");
	output(".");
	output("\n\nSighing happily, you step away and wipe a bit of sweat from your brow. The security operative looks a lot more like a security slut, glazed in your juices as [enemy.heShe] is. He’s in no shape to stop anyone from going anywhere but balls-deep in [enemy.hisHer] ass in the near future... and honestly, [enemy.heShe] might like that. ");
	if(pc.isBimbo()) output("You smile sweetly. <i>“Like wow! You’re super good at licking pussy. Maybe you should just do that instead of trying to be like, mean and stuff!");
	else if(!pc.isAss()) output("You mumble, <i>“Thanks,”</i> wondering if he’s in any shape to understand. In the end, you suppose it doesn’t matter either way.");
	else output("What a slut.");
	output("\n\nGathering up your equipment, you spare a brief glance at your foe’s belongings for any prizes before you go.");
	processTime(25);
	enemy.girlCumInMouth(pc);
	pc.orgasm();
	CombatManager.genericVictory();
}

//Facefuck - Either
public function faceFuckDatPussy(x:int):void
{
	clearOutput();
	showPunkSecOp(true);
	author("Fenoxo");
	//Bimbo
	if(pc.isBimbo()) output("<i>“Don’t worry, " + enemy.mf("mister","miss") + " kitty cat. I’m just gonna use your mouth a little, but it’ll be totally fun!”</i>");
	//Bro
	else if(pc.isBro()) output("You hook your finger the modded up feline’s mouth and rudely swab it around. <i>“This’ll do.”</i>");
	//Nice
	else if(pc.isNice()) output("You gently but firmly inform the defeated feline that while you aren’t going to hurt or abuse him, you do expect [enemy.himHer] to make up for the trouble he’s caused with [enemy.hisHer] mouth and tongue.");
	//Misch
	else if(pc.isMischievous()) output("<i>“I’ve got good news and bad news for you, kitty-cat. The good news is that I won’t hurt you. I’m just gonna fuck your mouth. The bad news is that I’m going to leave afterward, so we won’t get to snuggle.”</i>");
	//Hard
	else output("<i>“You’re jaw’s going to be sore when we’re finished here, kitty-cat. I deserve a little payback for the trouble you’ve caused.”</i>");
	//Merge
	//Unexposed no new pg
	if(!pc.isCrotchExposed()) 
	{
		output(" It’s time [enemy.heShe] saw what he’s going to be servicing. You whip it out, all " + num2Text(Math.round(pc.cocks[x].cLength())) + " inches of [pc.cockNoun].");
		if(pc.isErect()) output(" It’s already hard." + (pc.hasPriapism() ? " You couldn’t go soft if you wanted to right now.":""));
		else output(" Simply extracting it was enough to bring you to full hardness.");
	}
	//Exposed no new pg
	else output(" Already delightfully exposed, you give your " + (!pc.isErect() ? "increasingly rigid":"straining") + " erection a squeeze and a shake, aiming it straight at the pirate’s face.");
	//Merge
	//Not Lust
	if(enemy.lust() < enemy.lustMax())
	{
		output("\n\nLike a teenager on prom night, [enemy.hisHer] eyes go wide, not in shock or rage or denial... but in desire. [enemy.HeShe] licks [enemy.hisHer] lips, then tilts [enemy.hisHer] head and licks them again. Despite [enemy.hisHer] exhaustion and mild injury, [enemy.heShe] leans a little closer and lets [enemy.hisHer] ears flop back submissively. The holographic band across [enemy.hisHer] eyes fades away to give [enemy.himHer] a better view. [enemy.HisHer] nose wrinkles as [enemy.heShe] takes in your scent. At last, [enemy.heShe] looks back up with a blushing smile. <i>“This... I don’t mind. It’s a nice dick.”</i> [enemy.HeShe] licks [enemy.hisHer] lips again. <i>“Very nice.”</i>");
	}
	//Lust
	else
	{
		output("\n\nLike a thirsty galotion, [enemy.hisHer] eyes light up and lock on like the targeting system of a dick-seeking missile. <i>“I get to suck this?”</i> The holographic band across the kaithrit’s eyes fades away to give [enemy.himHer] an unobstructed view. <i>“Mmm... all of this...”</i> [enemy.HeShe] sniffs at it, nose twitching gently, then scooches even closer, [enemy.hisHer] ears falling back in contented submission. <i>“I don’t mind." + (pc.cocks[x].cLength() < 12 ? " It’s not stupid huge like what those jumpers pack.":"It’s not undersized like one of those rodenian rats. A little jaw-stretching will be... fun.") + "”</i> [enemy.HeShe] licks lips so that they shine. <i>“So fuck my face already, big [pc.guyGirl].”</i>");
	}
	//Merge
	output("\n\nYou need no further invitation. Grabbing the security operative by the back of the head (and careful of [enemy.hisHer] implants) you tug [enemy.himHer] forward onto your [pc.cock]. [enemy.HeShe] doesn’t struggle - anything but. [enemy.HisHer] mouth opens wide and [enemy.hisHer] tongue rolls out, offering you a slick red carpet to slide your [pc.cockHead] across on its journey to adoring oral service. [enemy.HisHer] [enemy.lipsChaste] feel wonderful, closing just tight enough to form a spit-slick seal once you’ve pushed past them and [enemy.hisHer] tongue... oh stars!");
	output("\n\nThe kaithrit’s tongue boils out of [enemy.hisHer] mouth like a living serpent, sliding out two inches for each one you add. This crossways motion assaults you with double the friction along your sensitive underside, like half your dick is slowly pumping in while the other half is midway through a real jack-hammering hummer. You gasp, then moan, then stop moving at all, content to revel in the sensation of that slick muscle spooling out - for now. You float on a curtain of undulating muscle, surrounded by the embrace of spit-slick lips.");
	//Nice
	if(pc.isNice())
	{
		output("\n\nYou may have claimed [enemy.hisHer] mouth by force, but you’re not an asshole about it. You pause and simply savor it. No need to be rough when the kaithrit is slobbering [enemy.hisHer] tongue all over you, looping around into an organic snare. [enemy.HeShe] looks up at you imploringly, all but begging you to fuck [enemy.hisHer] face.");
		output("\n\nSo be it.");
	}
	//Misch
	else if(pc.isMischievous())
	{
		output("\n\nYou take a moment to appreciate the glorious position which you now occupy. Your enemy is bested and making up for the inconvenience with [enemy.hisHer] mouth, [enemy.hisHer] slobbering tongue fully extended and looping itself around your girth in an organic snare. Amazing as it feels, it could be better. [enemy.HeShe] can handle a little more, right?");
	}
	//Hard
	else output("\n\nLike a conquering warrior, you pause in the moment of your victory to savor it - until the kaithrit runs out of slobbering tongue to extend and settles for looping it around you in an organic snare.");
	//Merge
	output("\n\nYou fuck the punky security operative’s overlong muscle back into [enemy.hisHer] mouth with a single mighty push. Spit dribbles from [enemy.hisHer] cheeks in sudden surprise, and [enemy.heShe] lets out a single inarticulate gurgle. " + (pc.cocks[x].cLength() < 12 ? "Running your fingers through [enemy.hisHer] hair, you admire your prize. [enemy.HisHer] hot breath is washing over your [pc.thighs] and [pc.belly]. [enemy.HisHer] tongue squirms and wriggles beneath your [pc.knot " + x + "]. The longer you hold [enemy.himHer] there, the more comfortable [enemy.heShe] seems, and all too soon, the slut-cat’s cheeks are rhythmically hollowing with eager suckles.":"Running your fingers through [enemy.hisHer] hair, you admire your prize, impaled partway down your length. [enemy.HeShe] can’t take the whole thing. There’s simply too much [pc.cockNounSimple] for [enemy.hisHer] untrained throat to handle, no matter how [enemy.heShe] tries. [enemy.HeShe] can grab at your [pc.butt] and strain, water streaming down [enemy.hisHer] eyes, but [enemy.heShe] only manages another inch or two at the most.\n\nGood for him. Maybe next time you bump into him, he’ll be a little better at it."));
	//Low libido
	if(pc.libido() < 50) output("\n\n[enemy.HisHer] tongue refuses to let you go. It loops around and around even as you draw back, muscle coiled into a helix of cock-milking pleasure such that you can’t even tug your [pc.cockHead] the whole way out. You’re <i>forced</i> to thrust yourself back inside by the thirsty kaithrit. [enemy.HisHer] sloppy, silken maw demands it. Like a sexual tractor beam, it inexorably pulls you onward. It compels you to fuck [enemy.himHer] faster than you meant to. Harder.");
	//High libido
	else output("\n\[enemy.HisHer] tongue clings on tightly as launch into motion. Even when you draw back, [enemy.hisHer] muscle squeezes into a helix of cock-caressing pleasure that feels so sensually compelling that your [pc.cockHead] never quite manages to leave [enemy.hisHer] mouth - not that you ever had any intent to do so. You slam your hips forward and back, spearing your turgid length through this frothing, cutely pursed lips with glee. [enemy.HisHer] mouth is just so <i>fuckable</i>! You’d be jackhammering [enemy.hisHer] face even if [enemy.hisHer] tongue wasn’t lavishing you with heavenly sensations.");
	//Merge
	//Longdick jacking
	if(pc.cocks[x].cLength() > 12)
	{
		output("\n\nA soft-fingered hand wraps around the exposed length of your too-big dick with a sort of desperate affection. The kaithrit’s eyes twinkle merrily while [enemy.hisHer] throat gurgles at its absolute limit, but [enemy.heShe] strokes all the same. [enemy.HeShe] jacks the extra dick like [enemy.heShe] can’t wait for you to bust a big, sloppy nut into [enemy.hisHer] mouth. [enemy.HeShe] strokes and [enemy.heShe] squeezes, adding a second hand to better please the jaw-straining boner. Leaking drool and pre provide plenty of pre-cum for [enemy.hisHer] nimble digits to work with as they wring you toward bliss.");
	}
	//else Second dick jacking
	else if(pc.cockTotal() > 1)
	{
		output("\n\nA soft-fingered hand wraps around " + (pc.cockTotal() == 2 ? "your other":"another") + " dick with a sort of desperate firmness. The kaithrit’s eyes twinkle merrily while [enemy.hisHer] throat gurgles, slowly pumping that second cock. [enemy.HisHer] fingers curl and squeeze. [enemy.HisHer] palm, slick with sweat, glides effortlessly across the veiny length. At the apex of your thrusts, [enemy.heShe] squeezes tighter. When you draw back, [enemy.hisHer] grip relaxes. In no time at all, he’s twirling a finger in small circles just below the [pc.cockHead], smearing a dribble of pre-cum into your bare, musky maleness.");
	}
	//Sheath Fingering?
	if(pc.hasSheath(x))
	{
		output("\n\nJust when you think it can’t get any better, a fingertip wriggles into your [pc.sheath]. A second chases after it a second later" + (pc.cocks[x].cLength() < 12 ? ", and then a tongue too":"") + ". The invaders probe your most sensitive locale with reckless abandon, pressing on hypersensitive nerves not meant to be pressed. Bolts of maddening pleasure race up your spine while the depraved pussycat explores the slick interior of your straining cock-holster. One finger wiggling back and forth brings you to a dangerously orgasmic edge, your whole middle clenching and flexing.");
	}
	//Pussy fingering
	if(pc.hasVagina()) output("\n\nA single intrusion into your [pc.vaginaNoun] nearly steals the strength from your [pc.legOrLegs]. That’s all your overheated entrance needed to light up like a town square Christmas tree, glowing and pulsing and thrumming with pure joy. You whine in the back of your throat, somehow continuing to face-fuck the cat-eared operative, but thrilling at the sudden appearance of a second finger. It pushes you to the very edge of bliss, then swirls you back and forth across the precipice for what feels like ages.");
	//Ball fondling
	if(pc.balls > 0) output("\n\nYour bouncing nut" + (pc.balls > 1 ? "s":"") + ", churning up a thick load of [pc.cumNoun], soon find" + (pc.balls == 1 ? "s itself":" themselves") + " in possession of a pair of eager palms. The kaithrit’s hands abandon everything else to pay homage to your lust-fattened orb" + (pc.balls > 1 ? "s":"") + ", stroking and squeezing, gently caressing the underside of your sack in an effort to coax an even larger orgasm from you. It feels like it’s working too. You feel heavier and tighter the longer [enemy.heShe] fondles. Pre dribbles freely into [enemy.hisHer] mouth in thicker and thicker quantities.");
	//Ball milking?
	if(pc.balls > 1 && pc.ballDiameter() >= 5)
	{
		output("\n\nYour tremendously weighty nuts wobble back and forth with tremendous mass. They slap into the kaithrit’s collarbones aggressively, jiggling and jostling. [enemy.HeShe] swiftly abandons everything else to get [enemy.hisHer] hands on your oh-so-virile orbs, wrapping [enemy.hisHer] fingers possessively around your cum-swollen balls as if to claim the contents for himself. [enemy.HeShe] smothers them into [enemy.hisHer] face, drowning himself in your ball-musk, even while taking a dick-deep into [enemy.hisHer] throat.");
		output("\n\nThis cat is a real nut-slut! [enemy.HisHer] fingers sink into the capacious flesh as [enemy.heShe] sets into worshipping your [pc.balls], massaging them imploringly, begging them to brew up the fattest, thickest load of cum the galaxy has ever seen. Yet even with both hands, [enemy.heShe] can’t quite handle your rebellious sack or the fluid contents within. It wobbles dangerously with your ecstatic clenches. The more [enemy.heShe] plays with your balls, the more unstable they become, contracting and squeezing - so tight and heavy!");
	}
	//Merge
	output("\n\nYou’re so close!");
	output("\n\nThe kaithrit’s tongue tightens up abruptly, leaving you no time to think or react - only to swell in exquisite ecstasy. You cum straight into the capable little cock-sucker’s mouth. Pumping hard, you pound [enemy.hisHer] face through your climax, exactly the way [enemy.heShe] so clearly wants it. Tears stream from [enemy.hisHer] eyes while [pc.cumVisc] goo ");
	if(pc.cumQ() < 5) output("dribbles");
	else if(pc.cumQ() < 30) output("spurts");
	else if(pc.cumQ() < 300) output("pours");
	else if(pc.cumQ() < 1000) output("erupts");
	else if(pc.cumQ() < 5000) output("floods");
	else output("drowns");
	output(" [enemy.hisHer] throat.");
	if(pc.cumQ() >= 500)
	{
		output(" Watching [enemy.hisHer] cheeks bulge");
		if(pc.cumQ() >= 5000) output(" before giving out and releasing [pc.cumColor] sprays from the corners of [enemy.hisHer] mouth");
		output(" is a delight.");
	}
	if(enemy.hasCock()) output(" Meanwhile, a puddle of ignored, kittenish semen spreads below, hardly noticed.");
	//Second+ dick & 10+ mLs
	if(pc.cockTotal() > 1 && pc.cumQ() >= 10)
	{
		output("\n\nYou grab hold of your extra dick" + (pc.cockTotal() > 2 ? "s":"") + " and make sure the rest of your orgasm goes exactly where it belongs: over [enemy.hisHer] ears and into [enemy.hisHer] hair");
		if(pc.cumQ() >= 500) output(", across [enemy.hisHer] forehead and down the tip of [enemy.hisHer] flaring nose");
		output(".");
		if(pc.cumQ() >= 1000) output(" Pretty much everywhere.");
		if(pc.cumQ() >= 5000) output(" You paint the kitty-[enemy.boyGirl] with your load inside and out until [enemy.heShe] is completely, thoroughly basted in cock-juice.");
	}
	output("\n\nYou push the cock-addled kaithrit away after achieving satisfaction. [enemy.HeShe] looks up at you dimly, panting lustily, like swallowing all that cum forced [enemy.hisHer] obviously cybernetic brain to begin a very thorough rebooting process. All pride or resistance is gone.");
	output("\n\nWhile you give [enemy.hisHer] possessions a quick search, [enemy.heShe] simply licks [enemy.hisHer] lips paws at [enemy.hisHer] lust-reddened genitals, a confused by satisfied expression on [enemy.hisHer] face.");
	processTime(30);
	pc.orgasm();
	enemy.loadInMouth(pc);
	output("\n\n");
	CombatManager.genericVictory();
}