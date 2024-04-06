List<String> originalStrings = [
"अपनी साइकिल का अन्वेषण करें",
"स्वस्थ मासिक धर्म यात्रा के लिए शैक्षिक संसाधनों और मूल्यवान सामग्री तक पहुंचें।",
"आपका व्यक्तिगत मार्गदर्शक",
"अपने व्यक्तिगत चैटबॉट साथी पैडी से मिलें - स्वतंत्र रूप से प्रश्न पूछें, रहस्यों को निजी रखें और व्यक्तिगत सलाह प्राप्त करें।",
"दान और सहभागिता के माध्यम से परिवर्तन को सशक्त बनाएं",
"समर्थन के उद्देश्य, कहानियाँ साझा करें, और समान विचारधारा वाले व्यक्तियों से जुड़ें",
'मासिक धर्म स्वच्छता',
"ईमेल",
"पासवर्ड",
"मुझे याद करो",
"पासवर्ड भूल गए?",
"दाखिल करना",
"खाता बनाएं",
"अवधि से जुड़ें",
"व्यक्तिगत मासिक धर्म स्वास्थ्य सहायता और संसाधनों के लिए हमारे समुदाय में शामिल हों।",
"या इसके साथ साइन इन करें",
"छोडना",
"अपना पासवर्ड रीसेट करने और अवधि तक पहुंच पुनः प्राप्त करने के निर्देश प्राप्त करने के लिए अपना ईमेल दर्ज करें।",
"जमा करना",
"पासवर्ड रीसेट ईमेल भेजा गया",
"आपके खाते की सुरक्षा हमारी प्राथमिकता है! हमने आपका पासवर्ड सुरक्षित रूप से बदलने और आपके खाते को सुरक्षित रखने के लिए आपको एक सुरक्षित लिंक भेजा है।",
"हो गया",
"ईमेल दुबारा भेजें",
"पहला नाम",
"उपनाम",
"उपयोगकर्ता नाम",
"फोन नंबर।",
"खाता बनाएं",
"या इसके साथ साइन अप करें",
"अपने ईमेल पते की पुष्टि करें",
"पीरियड के मासिक धर्म स्वास्थ्य संसाधनों तक पूर्ण पहुंच अनलॉक करने के लिए अपने ईमेल पते की पुष्टि करें।",
"आपका ईमेल सफलतापूर्वक सत्यापित कर दिया गया है। मासिक धर्म स्वास्थ्य संसाधनों और सामुदायिक सहायता तक पूर्ण पहुंच का आनंद लें।",
"जारी रखना",
"ईमेल दुबारा भेजें",
"संदेश टाइप करें",
"श्रेणियाँ",
'व्यवस्था करनेवाला',
'अभियान',
"आयोजन",
"खोज संगठन",
'मासिक धर्म स्वास्थ्य के लिए शुरुआती मार्गदर्शिका',
'विशेष रुप से प्रदर्शित वीडियोज़',
'नवीनतम लेख',
'पाठ्यक्रम विवरण',
'परिचय',
'रजोनिवृत्ति क्या है',
'महिलाओं को क्या परेशानी होती है?',
'प्रोफ़ाइल तस्वीर बदलें',
'प्रोफाइल की जानकारी',
'नाम',
'व्यक्तिगत जानकारी',
'जन्म की तारीख',
"खाता",
'अकाउंट सेटिंग',
"बुकमार्क किए गए संसाधन",
"मेरा दान",
"मेरे ब्लॉग",
"पसंदीदा अभियान",
"सहेजे गए ब्लॉग",
"अपने योगदान को ट्रैक करें",
"आपके अनुभव एक ही स्थान पर",
"अपने दिल के करीब कारणों से जुड़े रहें",
"आपका पसंदीदा पढ़ता है",
"अपने सहेजे गए शैक्षिक खजाने का अन्वेषण करें",
'एप्लिकेशन सेटिंग',
"भाषा बदलें",
"भाषा परिवर्तन के साथ अपने अनुभव को अनुकूलित करें",
"पीरियड में आपका स्वागत है!",
"पीरियड्स क्या हैं?",
"पसंद किए गए ब्लॉगों में जोड़ा गया",
"पसंद किए गए ब्लॉग में जोड़ने में विफल",
"विवरण",
"कोई ईवेंट नहीं मिला",
"अभी दान कीजिए",
"और पढ़ें",
"आप रहेंगे!",
"दान कार्यक्रम में शामिल होने के लिए धन्यवाद। आपके समर्थन से फर्क पड़ता है!",
"पंजीकरण करवाना",
"ब्लॉग अपलोड करें",
"तस्विर अपलोड करना",
"शीर्षक",
"सामग्री",
"वर्ग",
"ब्लॉग पोस्ट अपलोड करने में विफल",
"ब्लॉग अपलोड करें",
"ब्लॉग खोजें",
"नवीनतम ब्लॉग",
"आप कैसे हैं?",
"आज",
"उदार महसूस कर रहा हूँ,",
"अभियान नहीं मिला",
"घटना नहीं मिली",
"खोज संसाधन",
"मासिक धर्म स्वास्थ्य का परिचय",
"परिचय: पीरियड्स क्या हैं?",
"दैनिक जीवन पर मासिक धर्म स्वास्थ्य का प्रभाव",
"अरे लड़कियों! तो, आइए पीरियड्स के बारे में बात करें, या जैसा कि हम इसे कहते हैं, मासिक धर्म! यह एक मासिक चीज है जो हम महिलाओं के साथ होती है। मूल रूप से, यह तब होता है जब कुछ रक्त और ऊतक योनि के माध्यम से हमारे गर्भाशय से बाहर निकलते हैं। यह आमतौर पर शुरू होता है जब आप 12 वर्ष के होते हैं, लेकिन हे, यह हर किसी के लिए अलग होता है - कुछ पहले शुरू कर सकते हैं, कुछ बाद में। लेकिन कोई चिंता नहीं, यह सब बड़े होने और बाद में संभावित बच्चे पैदा करने के रोमांच के लिए तैयार होने का हिस्सा है! 😊 इस दौरान, आप सभी प्रकार की भावनाओं और शायद कुछ असुविधाओं को महसूस कर सकते हैं, लेकिन इससे परेशान न हों! इसे संभालने के कई तरीके हैं, और यह आमतौर पर केवल कुछ दिनों तक रहता है। मासिक धर्म के बारे में जानना बहुत महत्वपूर्ण है ताकि आप अपना ख्याल रख सकें और विश्वसनीय वयस्कों के साथ इसके बारे में बात करने में सहज महसूस करें। 🌸 \n\n अब, आइए विस्तार से जानें! तो, पीरियड्स होते हैं क्योंकि हमारे शरीर सुपर स्मार्ट होते हैं और हार्मोन से भरे होते हैं, जो संकेत भेजने वाले छोटे दूतों की तरह होते हैं। अंडाशय रिलीज करते हैं एस्ट्रोजेन और प्रोजेस्टेरोन नामक दो विशेष हार्मोन। ये हार्मोन यह अच्छा काम करते हैं जहां वे हमारे गर्भाशय की परत को एक संभावित बच्चे के लिए एक अच्छे बिस्तर की तरह आरामदायक और मोटा बनाते हैं। लेकिन अगर रास्ते में कोई बच्चा न हो, तो वह परत टूट जाती है और अलविदा कह देती है, जिससे रक्तस्राव होता है। फिर पूरा चक्र फिर से शुरू होता है! यह हमारे शरीर के लिए एक मासिक नृत्य पार्टी की तरह है! 💃🩸",
"मुझे अपना पहला मासिक धर्म कब आएगा?",
"अक्सर पूछे जाने वाले प्रश्न और आम मिथक",
"तो, ज्यादातर लड़कियों को आम तौर पर पहली माहवारी तब शुरू होती है जब वे लगभग 12 साल की होती हैं, लेकिन आप जानते हैं क्या? अगर यह 10 से 15 साल की उम्र के बीच किसी भी समय होता है तो यह पूरी तरह से अच्छा है। 🎉 आपके शरीर का अपना खुद का शेड्यूल होता है, वह अपना काम करता है ! ऐसा होने के लिए कोई निश्चित उम्र नहीं है, लेकिन कुछ संकेत हैं कि यह होने वाला है: जैसे, अक्सर, आपके स्तन बढ़ने के लगभग 2 साल बाद, आपको अपना मासिक धर्म दिखाई दे सकता है। इसके अलावा, एक बात यह भी है इसे योनि स्राव कहा जाता है, जो बलगम की तरह होता है, जिसे आप अपने अंडरवियर में देख या महसूस कर सकते हैं। चिंता न करें, यह सब सिर्फ आपका शरीर है जो इस नए साहसिक कार्य के लिए तैयार हो रहा है! 🌟 इसलिए, जब भी ऐसा हो, तो बस इसके साथ रहें! आपका शरीर जानता है कि वह क्या कर रहा है। 💪",
'पहला पीरियड कैसा लगता है?',
"मासिक धर्म स्वास्थ्य और मानसिक कल्याण",
"अरे लड़की! तो, जब आपको मासिक धर्म आता है, तो यह आपके शरीर की तरह हर महीने एक छोटी सी पार्टी का आयोजन करता है! 🎉 लेकिन हे, अगर आप इस दौरान थोड़ा अजीब महसूस करते हैं तो यह पूरी तरह से सामान्य है।कुछ लड़कियों को ऐंठन होती है या थोड़ी थकान महसूस होती है, लेकिन चिंता न करें, यह सब पैकेज का हिस्सा है। इसे ऐसे समझें कि आपका शरीर अपना काम कर रहा है, आपके रास्ते में आने वाले किसी भी रोमांच के लिए तैयार हो रहा है! 💪और हे, यह सब बुरा नहीं है! हो सकता है कि आपको कुछ प्यारी पीरियड अंडियाँ पहनने को मिलें या कुछ मज़ेदार पीरियड उत्पाद आज़माने को मिलें! 🩲 तो, प्रवाह को गले लगाओ, लड़की! और याद रखें, यह सब बड़े होने और अद्भुत बनने का हिस्सा है! 🌸💖 ",
"मासिक धर्म स्वच्छता एवं प्रबंधन",
"पीरियड हाइजीन 101: ए क्लीन क्वीन्स मैनुअल?",
"आपके मासिक धर्म के दौरान स्वच्छता सर्वोपरि है! पैड, टैम्पोन, या कप को बार-बार बदलने से शुरुआत करें - गुमनाम नायक। 🩸 पहले और बाद में अपने हाथ धोएं, जिससे आप स्वच्छता सुपरस्टार बन जाएंगे। 🧼 सौम्य, खुशबू रहित वाइप्स या क्लींजर का विकल्प चुनें। 🌸 पवित्र 'अंडरवियर शस्त्रागार' को भंडारित रखें और आवश्यकतानुसार बदलें। 💪 शावर की शक्ति को अपनाएं - वे आपके पीरियड दोस्त हैं। 🚿 अंत में, पैड को फ्लश करने के प्रलोभन से बचें - कचरे को उनका अंतिम गंतव्य बनने दें। 🚫 आप हैं न केवल स्वच्छता बनाए रखना; आप अपने मासिक धर्म क्षेत्र पर शासन करने वाली एक स्वच्छ रानी हैं!",
"पैड पावर: योर पीरियड बडी",
"पैड आपके मासिक धर्म के लिए जादुई ढाल की तरह हैं। 🛡️ इसके आवरण से एक को छीलें, इसे अपनी अंडियों (नीचे की ओर चिपचिपी तरफ) में रखें, और आप सेट हो गए। इसे हर 4-6 घंटे में बदलें या यदि यह भर जाए तो इससे पहले। ⏰ जब यह पूरा हो जाए अलग होने का समय आ गया है, इसे टॉयलेट पेपर में लपेटें, इसे कूड़ेदान में फेंक दें (शौचालय नहीं), और ता-दा - आप पीरियड प्रो हैं! 🗑️ और याद रखें, पैड विभिन्न आकारों में आते हैं, इसलिए जो महसूस हो उसे चुनें बिल्कुल आपके लिए। आसान, आरामदायक, और आप प्रभारी हैं! 💪🩸",
"स्टेन एस.ओ.एस.: ड्रेस एडिशन",
"उफ़, मासिक धर्म का दाग? कोई बड़ी बात नहीं! तेजी से कार्य करें: थोड़ा ठंडा पानी लें और धीरे से दाग को मिटा दें। 💦 यदि आप एक बैकपैक के साथ एक जासूस हैं, तो आपकी कमर के चारों ओर एक स्वेटर अद्भुत काम करता है। 🧥 बाथरूम में जाएं, साबुन का उपयोग करें और निंजा-शैली में दाग से निपटने के लिए ठंडा पानी। 🚽 चुटकी में? रणनीतिक लेयरिंग अपनाएं या किसी मित्र की आपातकालीन हुडी उधार लें। 👚 याद रखें, दाग होते हैं - आप एक दागदार सुपरहीरो बन रहे हैं! 💪🩸",
"पीरियड उत्पाद 101: आपकी उपयोगी मार्गदर्शिका",
"पीरियड्स आपके आराम के अनुरूप विभिन्न प्रकार के उत्पादों के साथ आते हैं। \n\n1. पैड: सबसे पहले, हमारे पास पैड हैं। ये बच्चे आरामदायक कपास से बने होते हैं और सभी आकार और आकारों में आते हैं। इनमें चिपचिपी पट्टियाँ होती हैं उन्हें अपनी अंडीज़ पर जगह पर रखने के लिए। बेहद आसान और विश्वसनीय! 👍 एक आरामदायक परत के लिए उन्हें अपनी अंडीज़ में चिपकाएँ। आवश्यकतानुसार बदलें।\n\n2. टैम्पोन: ये छोटे-छोटे चमत्कार अंदर चले जाते हैं, प्रवाह को सोख लेते हैं। आकार चुनें जो आपके प्रवाह स्तर पर फिट बैठता है। 🌊 ये गेम-चेंजर हो सकते हैं, खासकर खेल या तैराकी में सक्रिय लड़कियों के लिए। टैम्पोन छोटे कपास प्लग की तरह होते हैं जिन्हें आप अपनी योनि में डालते हैं। वे आपकी मदद करने के लिए आसान एप्लिकेटर के साथ आते हैं। हालांकि, याद रखें , टॉक्सिक शॉक सिंड्रोम नामक एक दुर्लभ लेकिन गंभीर संक्रमण से बचने के लिए कभी भी टैम्पोन को 8 घंटे से अधिक न छोड़ें। ⏰\n\n3. मासिक धर्म कप: एक पुन: प्रयोज्य सुपरहीरो की तरह, वे प्रवाह को इकट्ठा करते हैं। मोड़ो, डालें, और आप तैयार हैं घंटों के लिए अच्छा है। ♻️ ये सिलिकॉन से बने होते हैं और पुन: प्रयोज्य होते हैं, जो बहुत अच्छा है! आप बस इसे डालते हैं, और यह रक्त को तब तक एकत्र करता है जब तक आप इसे खाली करने के लिए तैयार नहीं हो जाते। साथ ही, यह पर्यावरण-अनुकूल है! 🌱\n\n4. पीरियड पैंटी: अंतर्निर्मित जादू वाला अंडरवियर। वे बिना किसी अतिरिक्त सहायता के हल्के से मध्यम प्रवाह को संभालते हैं। 👙\n\n5. पीरियड डिस्क: आपके प्रवाह के लिए एक फ्रिसबी की तरह। इसे आंतरिक रूप से एकत्रित करें, और आप कुछ समय के लिए इसके बारे में भूल सकते हैं। 🥏\n\nयाद रखें, यह सब वही है जो आपको सही लगता है। अपना पीरियड पार्टनर चुनें, और आप मासिक रोमांच के लिए तैयार हैं! 🌈🩸✨\n\nतो, यह आपके पास है! थोड़ा प्रयोग करें और खोजें कि आपके लिए क्या सही है। आपका काल, आपके नियम! 💁‍♀️🩸",
"फिजियोलॉजी को समझना",
"पीरियड्स का अनावरण: लड़कियों के लिए अंतिम गाइड",
"डरो मत, पीरियड योद्धा! अगर आंटी फ्लो स्कूल के घंटों के दौरान आने का फैसला करती है, तो अपने बैग में पैड या टैम्पोन का एक भंडार छिपा लें। 🎒 एक भरोसेमंद दोस्त के साथ टीम बनाएं - एक पीरियड दोस्त, यदि आप चाहें - जो आपका समर्थन कर सकता है आपूर्ति। 🤝 यदि अप्रत्याशित घटित होता है, तो घबराएं नहीं; अधिकांश स्कूलों में सावधानीपूर्वक बाथरूम या एक सहायक नर्स की व्यवस्था होती है। 🚽 हमेशा एक गुप्त हथियार रखें, जैसे कि आपकी कमर के चारों ओर एक आरामदायक स्वेटर बंधा हुआ हो, बस मामले में। 🧥 और याद रखें, आप' आप अकेले नहीं हैं - हम सब वहाँ रहे हैं, और यह एक पीरियड प्रोफेशनल के जीवन का एक और दिन है! 💪🩸",
"पीरियड्स की दुनिया में आपका स्वागत है - एक मासिक साहसिक! 🎉 सबसे पहले, अपने भरोसेमंद साथियों से मिलें: पैड, टैम्पोन, या मासिक धर्म कप। 🩸 ऐप्स या पुराने-स्कूल कैलेंडर के साथ अपने चक्र को ट्रैक करें; ज्ञान ही शक्ति है। 📅 आरामदायक कपड़े अपनाएं, एक गर्म पानी की बोतल, और शायद मासिक उत्सव के दौरान कुछ चॉकलेट। 🍫 दागों से डरें नहीं - उन्हें ठंडे पानी और सुपरहीरो मानसिकता से निपटें। 💦 यदि आपको बैकअप की आवश्यकता है तो विश्वसनीय दोस्तों या वयस्कों के साथ चैट करें। 🗣️ याद रखें, मासिक धर्म आपके शरीर का है कहने का तरीका, 'अरे, मैं अद्भुत हूँ!' 💁आप नियंत्रण में हैं, पीरियड प्रो! 💪🌟",
"डिकोडिंग पीएमएस: द मंथली गेस्ट",
"अक्सर पूछे जाने वाले प्रश्न और आम मिथक",
"पीएमएस का मतलब प्रीमेन्स्ट्रुअल सिंड्रोम है - एक टैग-साथी साथी जो आपके मासिक धर्म से पहले आता है। 🚶‍♀️ यह मूड स्विंग, ऐंठन और सूजन जैसी शारीरिक और भावनात्मक साइडकिक्स का मिश्रण लाता है। 😩 सोचोयह आपके शरीर का आपको सचेत करने का तरीका है कि पीरियड पार्टी आने वाली है। 🎉 चॉकलेट की चाहत, कोमल भावनाएं और कभी-कभार सुपरहीरो मूड में बदलाव परेड में शामिल हो सकते हैं। 🍫चिंता मत करो; यह सब मासिक स्क्रिप्ट का हिस्सा है। 📜 अपने आप से दयालु व्यवहार करें, शायद एक चॉकलेट बार के साथ, और पीएमएस तरंग की सवारी करें जैसे कि आप पीरियड प्रो हैं! 🌊🍫🌟",
"क्या कोई लड़की मासिक धर्म शुरू होते ही गर्भवती हो सकती है?",
    "हां, एक लड़की मासिक धर्म शुरू होते ही गर्भवती हो सकती है। 🤰 एक लड़की अपने पहले मासिक धर्म से ठीक पहले भी गर्भवती हो सकती है। 🔄 ऐसा इसलिए है क्योंकि लड़की के हार्मोन पहले से ही सक्रिय हो सकते हैं। 💫 हार्मोन के कारण ओव्यूलेशन हो सकता है और गर्भाशय की दीवार का निर्माण। 🏗️ यदि कोई लड़की यौन संबंध बनाती है, तो वह गर्भवती हो सकती है, भले ही उसे कभी मासिक धर्म न हुआ हो। 🚼",
'पीरियड दर्द और सहायता का प्रबंधन',
"ऐंठन 101: मासिक धर्म के दर्द को कम करना",
"पीरियड क्रैम्प्स आपके पेट के लिए छोटे वर्कआउट की तरह हैं - सबसे अच्छे मेहमान नहीं, है ना? 💔 यदि आवश्यक हो तो अपने पेट पर गर्म पैड या कुछ दर्द निवारक दवाओं के साथ इसका मुकाबला करें। 🔥 हाइड्रेटेड रहने के लिए पानी पिएं - यह आपके गुप्त हथियार की तरह है। 💧 प्रयास करें स्ट्रेचिंग या योग जैसे आसान व्यायाम; वे ऐंठन के खिलाफ सुपरहीरो की चाल की तरह हैं। 🧘‍♀️ एक आरामदायक जगह ढूंढें, अपने पसंदीदा शो देखें और आराम करें। 📺 याद रखें, आप उन ऐंठन के मालिक हैं; वे टिके नहीं रहेंगे हमेशा के लिए। 💪🩸",
"पीरियड साइडकिक 101: ए पॉकेट गाइड",
"दोस्तों को उनके मासिक धर्म के दौरान सहायता करना बहुत आसान है! 💨 पहला कदम: चॉकलेट का स्टॉक करें, जो परम आरामदेह चीज़ है। 🍫 हीटिंग पैड जैसी आरामदायक सुविधाएं प्रदान करें और कंबल घोंसलों की कला में महारत हासिल करें। 🛌 चुटकुलों या प्यारे वीडियो के साथ ध्यान भटकाने वाले गुरु बनें . 🤣 आप सिर्फ एक दोस्त नहीं हैं; आप उनकी अवधि की गाथा में सुपरहीरो हैं! 💪🩸",
"स्कूल में पीरियड्स: एक त्वरित जीवन रक्षा गाइड",
"फर्स्ट पीरियड पार्टी: योर क्विक गाइड",
"पीरियड क्लब में शामिल होने के लिए बधाई! 🎉 पहला कदम: घबराएं नहीं; यह एक प्राकृतिक सुपरहीरो कौशल है। 💪 आपूर्ति की जांच करें - पैड या टैम्पोन - और यदि आप अनिश्चित हैं, तो एक भरोसेमंद दोस्त या एक समझदार वयस्क आपका साथी हो सकता है . 🦸 ढीले कपड़ों और शायद गर्म पानी की बोतल के साथ आरामदायक माहौल अपनाएं। 🌡️ इस संस्कार का जश्न मनाएं - आप आधिकारिक तौर पर पीरियड प्रो हैं! 💫🩸",
"रजोनिवृत्ति रहस्य का अनावरण",
"रजोनिवृत्ति नारीत्व यात्रा में अंतिम समापन की तरह है। 🎉 यह तब होता है जब अंडाशय अपने अंडे-उत्पादक कार्य से ब्रेक लेने का फैसला करते हैं। 🥚 आमतौर पर 40 के दशक के अंत या 50 के दशक की शुरुआत में, रजोनिवृत्ति मासिक धर्म पार्टी में विराम लाती है। 🎉 पीरियड्स को अलविदा कहें, लेकिन नए रोमांच को नमस्कार! 👋 इस बदलाव के साथ-साथ, हार्मोनल बदलाव गर्म चमक, मनोदशा में बदलाव और अन्य कैमियो उपस्थिति ला सकते हैं। 🔥 चिंता न करें; यह जीवन की कहानी का एक स्वाभाविक हिस्सा है। 📖 इसे गले लगाओ ग्रेस, शायद हॉट फ़्लैश की प्रशंसक है, और जानती है कि आप एक नए अध्याय में प्रवेश कर रहे हैं - रजोनिवृत्ति के बाद की बुद्धिमान और अद्भुत दुनिया। 🚪🚶‍♀️🌅",
"प्रोफ़ाइल",
"पसंदीदा ब्लॉग",
"भाषा चुनें",
"वह भाषा चुनें जो आपकी प्राथमिकताओं के लिए सबसे उपयुक्त हो",
"पसंद किए गए वीडियो",
"कोई ब्लॉग नहीं मिला",
"पंजीकृत घटनाएँ",
"अपनी लिखित अंतर्दृष्टि का अन्वेषण करें",
"अपनी पसंदीदा पुस्तकें संकलित करें",
"अपनी व्यस्तताओं के बारे में अपडेट रहें",
"तारांकित लेख",
"अपनी तारांकित पुस्तकों तक पहुंचें",
"अपने पसंदीदा वीडियो संभाल कर रखें",
];