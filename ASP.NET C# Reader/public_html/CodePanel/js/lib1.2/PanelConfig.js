
var ConfigView = function(name) {
    this.SwipPanel;
    this.Temlate = "";
    this.PanelElement = "";
    this.view_name = "";



    if (typeof name != 'undefined') {
        this.Temlate = name + "Template";
        this.PanelElement = name + "Panel";
        this.SwipPanel = name + "Swip";
        this.view_name = name;
    }
    this.SetSwip = function(name) { this.SwipPanel = name; }
    this.SetTemplate = function(name) { this.Temlate = name; }
    this.SetPanel = function(name) { this.PanelElement = name }

    this.Swip = function() { return this.SwipPanel; }
    this.Template = function() { return this.Temlate; }
    this.Panel = function() { return this.PanelElement; }
    this.View = function() { return this.view_name; }

    this.SwipID = function() { return "#" + this.SwipPanel; }
    this.TemplateID = function() { return "#" + this.Temlate; }
    this.PanelID = function() { return "#" + this.PanelElement; }
}
