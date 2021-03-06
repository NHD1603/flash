/***********************************************************
 * 
 * Copyright 2011 Adobe Systems Incorporated. All Rights Reserved.
 *
 * *********************************************************
 * The contents of this file are subject to the Berkeley Software Distribution (BSD) Licence
 * (the "License"); you may not use this file except in
 * compliance with the License. 
 *
 * Software distributed under the License is distributed on an "AS IS"
 * basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
 * License for the specific language governing rights and limitations
 * under the License.
 *
 *
 * The Initial Developer of the Original Code is Adobe Systems Incorporated.
 * Portions created by Adobe Systems Incorporated are Copyright (C) 2011 Adobe Systems
 * Incorporated. All Rights Reserved.
 **********************************************************/
package org.osmf.smpte.tt.model
{
	import org.osmf.smpte.tt.model.metadata.MetadataElement;
	import org.osmf.smpte.tt.timing.TimeTree;
	
	public class StylingElement extends TimedTextElementBase
	{
		public function StylingElement()
		{
		}
		
		//{ region validity
		/*
		<styling
		xml:id = ID
		xml:lang = string
		xml:space = (default|preserve)
		{any attribute not in default or any TT namespace ...}>
		Content: Metadata.class*, style*
		</styling>
		*/
		protected override function validAttributes():void
		{
			validateAttributes(false, false, false, false, false, false);
		}
		
		protected override function validElements():void
		{
			var child:uint = 0;
			
			while ((child < children.length)
				&& ((children[child] is org.osmf.smpte.tt.model.MetadataElement)
					|| (children[child] is org.osmf.smpte.tt.model.metadata.MetadataElement)))
			{
				child++;
			}
			while ((child < children.length)
				&& (children[child] is StyleElement))
			{
				child++;
			}
			
			if (children.length != child)
			{
				error(children[child] + " is not allowed in " + this + " at position " + child);
			}
			
			// now check each of the children is individually valid
			for each (var element:TimedTextElementBase in children)
			{
				element.valid();
			}
		}
		//} endregion
	}
}