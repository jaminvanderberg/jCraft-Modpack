import minetweaker.item.IIngredient;

val iron = <ore:ingotIron>;
val diamond = <ore:gemDiamond>;

val stableSigil = <ExtraUtilities:divisionSigil>.onlyWithTag({stable:1});
val unstableSigil = <ExtraUtilities:divisionSigil>;
val stableIngot = <ExtraUtilities:unstableingot:2>;

val unstableIngot = <ExtraUtilities:unstableingot>.withTag({display: {Lore: ["You go boom boom if", " use shift-click in a crafting window"]}, dimension:0, time:0});

var sigils = [unstableSigil.onlyWithTag({damage:1}), unstableSigil.onlyWithTag({damage:2}), unstableSigil.onlyWithTag({damage:3}), unstableSigil.onlyWithTag({damage:4}), unstableSigil.onlyWithTag({damage:5}), unstableSigil.onlyWithTag({damage:6}), unstableSigil.onlyWithTag({damage:7}), unstableSigil.onlyWithTag({damage:8}), unstableSigil.onlyWithTag({damage:9}), unstableSigil.onlyWithTag({damage:10}), unstableSigil.onlyWithTag({damage:11}), unstableSigil.onlyWithTag({damage:12}), unstableSigil.onlyWithTag({damage:13}), unstableSigil.onlyWithTag({damage:14}), unstableSigil.onlyWithTag({damage:15}), unstableSigil.onlyWithTag({damage:16}), unstableSigil.onlyWithTag({damage:17}), unstableSigil.onlyWithTag({damage:18}), unstableSigil.onlyWithTag({damage:19}), unstableSigil.onlyWithTag({damage:20}), unstableSigil.onlyWithTag({damage:21}), unstableSigil.onlyWithTag({damage:22}), unstableSigil.onlyWithTag({damage:23}), unstableSigil.onlyWithTag({damage:24}), unstableSigil.onlyWithTag({damage:25}), unstableSigil.onlyWithTag({damage:26}), unstableSigil.onlyWithTag({damage:27}), unstableSigil.onlyWithTag({damage:28}), unstableSigil.onlyWithTag({damage:29}), unstableSigil.onlyWithTag({damage:30}), unstableSigil.onlyWithTag({damage:31}), unstableSigil.onlyWithTag({damage:32}), unstableSigil.onlyWithTag({damage:33}), unstableSigil.onlyWithTag({damage:34}), unstableSigil.onlyWithTag({damage:35}), unstableSigil.onlyWithTag({damage:36}), unstableSigil.onlyWithTag({damage:37}), unstableSigil.onlyWithTag({damage:38}), unstableSigil.onlyWithTag({damage:39}), unstableSigil.onlyWithTag({damage:40}), unstableSigil.onlyWithTag({damage:41}), unstableSigil.onlyWithTag({damage:42}), unstableSigil.onlyWithTag({damage:43}), unstableSigil.onlyWithTag({damage:44}), unstableSigil.onlyWithTag({damage:45}), unstableSigil.onlyWithTag({damage:46}), unstableSigil.onlyWithTag({damage:47}), unstableSigil.onlyWithTag({damage:48}), unstableSigil.onlyWithTag({damage:49}), unstableSigil.onlyWithTag({damage:50}), unstableSigil.onlyWithTag({damage:51}), unstableSigil.onlyWithTag({damage:52}), unstableSigil.onlyWithTag({damage:53}), unstableSigil.onlyWithTag({damage:54}), unstableSigil.onlyWithTag({damage:55}), unstableSigil.onlyWithTag({damage:56}), unstableSigil.onlyWithTag({damage:57}), unstableSigil.onlyWithTag({damage:58}), unstableSigil.onlyWithTag({damage:59}), unstableSigil.onlyWithTag({damage:60}), unstableSigil.onlyWithTag({damage:61}), unstableSigil.onlyWithTag({damage:62}), unstableSigil.onlyWithTag({damage:63}), unstableSigil.onlyWithTag({damage:64}), unstableSigil.onlyWithTag({damage:65}), unstableSigil.onlyWithTag({damage:66}), unstableSigil.onlyWithTag({damage:67}), unstableSigil.onlyWithTag({damage:68}), unstableSigil.onlyWithTag({damage:69}), unstableSigil.onlyWithTag({damage:70}), unstableSigil.onlyWithTag({damage:71}), unstableSigil.onlyWithTag({damage:72}), unstableSigil.onlyWithTag({damage:73}), unstableSigil.onlyWithTag({damage:74}), unstableSigil.onlyWithTag({damage:75}), unstableSigil.onlyWithTag({damage:76}), unstableSigil.onlyWithTag({damage:77}), unstableSigil.onlyWithTag({damage:78}), unstableSigil.onlyWithTag({damage:79}), unstableSigil.onlyWithTag({damage:80}), unstableSigil.onlyWithTag({damage:81}), unstableSigil.onlyWithTag({damage:82}), unstableSigil.onlyWithTag({damage:83}), unstableSigil.onlyWithTag({damage:84}), unstableSigil.onlyWithTag({damage:85}), unstableSigil.onlyWithTag({damage:86}), unstableSigil.onlyWithTag({damage:87}), unstableSigil.onlyWithTag({damage:88}), unstableSigil.onlyWithTag({damage:89}), unstableSigil.onlyWithTag({damage:90}), unstableSigil.onlyWithTag({damage:91}), unstableSigil.onlyWithTag({damage:92}), unstableSigil.onlyWithTag({damage:93}), unstableSigil.onlyWithTag({damage:94}), unstableSigil.onlyWithTag({damage:95}), unstableSigil.onlyWithTag({damage:96}), unstableSigil.onlyWithTag({damage:97}), unstableSigil.onlyWithTag({damage:98}), unstableSigil.onlyWithTag({damage:99}), unstableSigil.onlyWithTag({damage:100}), unstableSigil.onlyWithTag({damage:101}), unstableSigil.onlyWithTag({damage:102}), unstableSigil.onlyWithTag({damage:103}), unstableSigil.onlyWithTag({damage:104}), unstableSigil.onlyWithTag({damage:105}), unstableSigil.onlyWithTag({damage:106}), unstableSigil.onlyWithTag({damage:107}), unstableSigil.onlyWithTag({damage:108}), unstableSigil.onlyWithTag({damage:109}), unstableSigil.onlyWithTag({damage:110}), unstableSigil.onlyWithTag({damage:111}), unstableSigil.onlyWithTag({damage:112}), unstableSigil.onlyWithTag({damage:113}), unstableSigil.onlyWithTag({damage:114}), unstableSigil.onlyWithTag({damage:115}), unstableSigil.onlyWithTag({damage:116}), unstableSigil.onlyWithTag({damage:117}), unstableSigil.onlyWithTag({damage:118}), unstableSigil.onlyWithTag({damage:119}), unstableSigil.onlyWithTag({damage:120}), unstableSigil.onlyWithTag({damage:121}), unstableSigil.onlyWithTag({damage:122}), unstableSigil.onlyWithTag({damage:123}), unstableSigil.onlyWithTag({damage:124}), unstableSigil.onlyWithTag({damage:125}), unstableSigil.onlyWithTag({damage:126}), unstableSigil.onlyWithTag({damage:127}), unstableSigil.onlyWithTag({damage:128}), unstableSigil.onlyWithTag({damage:129}), unstableSigil.onlyWithTag({damage:130}), unstableSigil.onlyWithTag({damage:131}), unstableSigil.onlyWithTag({damage:132}), unstableSigil.onlyWithTag({damage:133}), unstableSigil.onlyWithTag({damage:134}), unstableSigil.onlyWithTag({damage:135}), unstableSigil.onlyWithTag({damage:136}), unstableSigil.onlyWithTag({damage:137}), unstableSigil.onlyWithTag({damage:138}), unstableSigil.onlyWithTag({damage:139}), unstableSigil.onlyWithTag({damage:140}), unstableSigil.onlyWithTag({damage:141}), unstableSigil.onlyWithTag({damage:142}), unstableSigil.onlyWithTag({damage:143}), unstableSigil.onlyWithTag({damage:144}), unstableSigil.onlyWithTag({damage:145}), unstableSigil.onlyWithTag({damage:146}), unstableSigil.onlyWithTag({damage:147}), unstableSigil.onlyWithTag({damage:148}), unstableSigil.onlyWithTag({damage:149}), unstableSigil.onlyWithTag({damage:150}), unstableSigil.onlyWithTag({damage:151}), unstableSigil.onlyWithTag({damage:152}), unstableSigil.onlyWithTag({damage:153}), unstableSigil.onlyWithTag({damage:154}), unstableSigil.onlyWithTag({damage:155}), unstableSigil.onlyWithTag({damage:156}), unstableSigil.onlyWithTag({damage:157}), unstableSigil.onlyWithTag({damage:158}), unstableSigil.onlyWithTag({damage:159}), unstableSigil.onlyWithTag({damage:160}), unstableSigil.onlyWithTag({damage:161}), unstableSigil.onlyWithTag({damage:162}), unstableSigil.onlyWithTag({damage:163}), unstableSigil.onlyWithTag({damage:164}), unstableSigil.onlyWithTag({damage:165}), unstableSigil.onlyWithTag({damage:166}), unstableSigil.onlyWithTag({damage:167}), unstableSigil.onlyWithTag({damage:168}), unstableSigil.onlyWithTag({damage:169}), unstableSigil.onlyWithTag({damage:170}), unstableSigil.onlyWithTag({damage:171}), unstableSigil.onlyWithTag({damage:172}), unstableSigil.onlyWithTag({damage:173}), unstableSigil.onlyWithTag({damage:174}), unstableSigil.onlyWithTag({damage:175}), unstableSigil.onlyWithTag({damage:176}), unstableSigil.onlyWithTag({damage:177}), unstableSigil.onlyWithTag({damage:178}), unstableSigil.onlyWithTag({damage:179}), unstableSigil.onlyWithTag({damage:180}), unstableSigil.onlyWithTag({damage:181}), unstableSigil.onlyWithTag({damage:182}), unstableSigil.onlyWithTag({damage:183}), unstableSigil.onlyWithTag({damage:184}), unstableSigil.onlyWithTag({damage:185}), unstableSigil.onlyWithTag({damage:186}), unstableSigil.onlyWithTag({damage:187}), unstableSigil.onlyWithTag({damage:188}), unstableSigil.onlyWithTag({damage:189}), unstableSigil.onlyWithTag({damage:190}), unstableSigil.onlyWithTag({damage:191}), unstableSigil.onlyWithTag({damage:192}), unstableSigil.onlyWithTag({damage:193}), unstableSigil.onlyWithTag({damage:194}), unstableSigil.onlyWithTag({damage:195}), unstableSigil.onlyWithTag({damage:196}), unstableSigil.onlyWithTag({damage:197}), unstableSigil.onlyWithTag({damage:198}), unstableSigil.onlyWithTag({damage:199}), unstableSigil.onlyWithTag({damage:200}), unstableSigil.onlyWithTag({damage:201}), unstableSigil.onlyWithTag({damage:202}), unstableSigil.onlyWithTag({damage:203}), unstableSigil.onlyWithTag({damage:204}), unstableSigil.onlyWithTag({damage:205}), unstableSigil.onlyWithTag({damage:206}), unstableSigil.onlyWithTag({damage:207}), unstableSigil.onlyWithTag({damage:208}), unstableSigil.onlyWithTag({damage:209}), unstableSigil.onlyWithTag({damage:210}), unstableSigil.onlyWithTag({damage:211}), unstableSigil.onlyWithTag({damage:212}), unstableSigil.onlyWithTag({damage:213}), unstableSigil.onlyWithTag({damage:214}), unstableSigil.onlyWithTag({damage:215}), unstableSigil.onlyWithTag({damage:216}), unstableSigil.onlyWithTag({damage:217}), unstableSigil.onlyWithTag({damage:218}), unstableSigil.onlyWithTag({damage:219}), unstableSigil.onlyWithTag({damage:220}), unstableSigil.onlyWithTag({damage:221}), unstableSigil.onlyWithTag({damage:222}), unstableSigil.onlyWithTag({damage:223}), unstableSigil.onlyWithTag({damage:224}), unstableSigil.onlyWithTag({damage:225}), unstableSigil.onlyWithTag({damage:226}), unstableSigil.onlyWithTag({damage:227}), unstableSigil.onlyWithTag({damage:228}), unstableSigil.onlyWithTag({damage:229}), unstableSigil.onlyWithTag({damage:230}), unstableSigil.onlyWithTag({damage:231}), unstableSigil.onlyWithTag({damage:232}), unstableSigil.onlyWithTag({damage:233}), unstableSigil.onlyWithTag({damage:234}), unstableSigil.onlyWithTag({damage:235}), unstableSigil.onlyWithTag({damage:236}), unstableSigil.onlyWithTag({damage:237}), unstableSigil.onlyWithTag({damage:238}), unstableSigil.onlyWithTag({damage:239}), unstableSigil.onlyWithTag({damage:240}), unstableSigil.onlyWithTag({damage:241}), unstableSigil.onlyWithTag({damage:242}), unstableSigil.onlyWithTag({damage:243}), unstableSigil.onlyWithTag({damage:244}), unstableSigil.onlyWithTag({damage:245}), unstableSigil.onlyWithTag({damage:246}), unstableSigil.onlyWithTag({damage:247}), unstableSigil.onlyWithTag({damage:248}), unstableSigil.onlyWithTag({damage:249}), unstableSigil.onlyWithTag({damage:250}), unstableSigil.onlyWithTag({damage:251}), unstableSigil.onlyWithTag({damage:252}), unstableSigil.onlyWithTag({damage:253}), unstableSigil.onlyWithTag({damage:254}), unstableSigil.onlyWithTag({damage:255}), unstableSigil.onlyWithTag({damage:256})] as IIngredient[];

recipes.removeShaped(<ExtraUtilities:unstableingot>);
recipes.addShaped(stableIngot, [[iron], [stableSigil], [diamond]]);

for x, sil in sigils {

     recipes.addShaped(unstableIngot, [[iron], [sil], [diamond]]);
}