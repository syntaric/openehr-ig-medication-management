<style>
  /* This page is a tab of the WebTemplate page. As on the other tabs, the
     tabs go above the page title, and the title is not numbered. */
  .col-12:has(> #webtemplate-mindmap) { display: flex; flex-direction: column; }
  .col-12:has(> #webtemplate-mindmap) > #publish-box { order: -2; }
  .col-12:has(> #webtemplate-mindmap) > .nav-tabs { order: -1; }
  .col-12:has(> #webtemplate-mindmap) > h2::before { content: none; }
</style>

{% include fragment-base-navtabs.html type='WebTemplate' id='cistec.openehr.medicationorder.v1' active='mindmap' lang='en' %}

The mind map shows the template's tree for an overview. Slot fills are grouped under the slot they fill, hovering a node shows its description, and coded elements link to their value set on the [Terminology](terminology.html) page. Click a node's circle to expand or collapse it, and drag or scroll to move and zoom. *Tree* switches to an indented tree of the same nodes, the checkboxes show or hide details, and *Full screen* enlarges the map. It can also be opened [on its own page](template-mindmap.html).

<iframe id="webtemplate-mindmap" src="template-mindmap.html" title="Mind map of the template cistec.openehr.medication_order.v1" allow="fullscreen" style="width: 100%; height: 75vh; border: 1px solid #ccc;"></iframe>
