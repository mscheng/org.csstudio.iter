/*******************************************************************************
 * Copyright (c) 2010-2015 ITER Organization.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 ******************************************************************************/
package org.csstudio.iter.css.product;

import org.csstudio.startup.application.Application;
import org.eclipse.equinox.app.IApplicationContext;

/**
 * 
 * <code>ITERApplication</code> is an extension of the default CSS application that suppresses
 * a specific exception printout made by third party plugins
 *
 * @author <a href="mailto:jaka.bobnar@cosylab.com">Jaka Bobnar</a>
 *
 */
public class ITERApplication extends Application {

    @Override
    public Object start(IApplicationContext context) throws Exception {      
        Object o = super.start(context);
        //Bugfix/workaround for org.apache.felix.gogo.shell.Activator, 
        //which prints InterruptedException if stopped before it was even started.
        //It is using a hardcoded 100 ms sleep, so we should be safe if we wait 150 ms for
        //that plugin to finish its magic.
        Thread.sleep(150);
        return o;
    }
}
