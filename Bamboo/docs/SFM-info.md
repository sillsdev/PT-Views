# Paratext SFM Views release<a id="sfm"></a>

This additional tool for Paratext is designed to help uses highlight particular parts of the USFM. If you want to change a color then you will need a knoledge of CSS (Cascading Style Sheets) or have some one who does  know that information.

The views come in one form.

## Views
- **SFM-highlighter-view** -- This view highlights inline parts of the SFM.

## There are two SFM Views controls
### **Tools > Custom Tools > Bamboo Views** though only one will be visible at any time.

- Hide SFM Views 
- Show SFM Views 

### Editing the SFM-hilighter.xslt file

Note: This file is an XML file. You must not make changes that make this file invalid.

Edit only the part shown in the red box below.

![SFM View CSS](../images/SFM-View-css.png)

To target a particular SFM use the SFM as a CSS class. To target a quote \q then write a class:
```
.q {background:silver;}
```

If you just want text, with colors, but no sfm markup showing then change the .sfm class.
```
.sfm {display:none;}
```

If you want to create another view, copy the SFM-hilighter.xslt file and call it SFM-new-name.xslt. That is preserve the SFM at the start and the .xslt at the end. Make your CSS styling changes. Then copy that file to C:\Users\Public\PT-Bamboo-Views\Views and to your Views folder in the My Paratext Project folder. Also copy the SFM-hilighter.xml file and give it the same name as the new .xslt file but with a .xml extension. Also copy this file to the C:\Users\Public\PT-Bamboo-Views\Views folder. Then you can hide/show the view as needed. You must restart Paratext if you had it open when you were making the above changes.

For Example:<br/>
Copy SFM-hilighter.xslt to SFM-highlight-quotes.xslt<br/>
Copy SFM-hilighter.xml to SFM-highlight-quotes.xml


