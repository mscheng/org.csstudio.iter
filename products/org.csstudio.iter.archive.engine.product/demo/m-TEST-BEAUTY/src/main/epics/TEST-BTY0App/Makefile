#+======================================================================
# $HeadURL: https://svnpub.iter.org/codac/iter/codac/dev/units/m-epics-iter-templates/tags/CODAC-CORE-3.1.0/templates/sddconfApp/Makefile $
# $Id: Makefile 25465 2012-02-17 14:40:24Z zagara $
#
# Project       : CODAC Core System
#
# Description   : Makefile
#
# Author(s)     : Cosylab
#
# Copyright (c) : 2010-2015 ITER Organization,
#                 CS 90 046
#                 13067 St. Paul-lez-Durance Cedex
#                 France
#
# This file is part of ITER CODAC software.
# For the terms and conditions of redistribution or use of this software
# refer to the file ITER-LICENSE.TXT located in the top level directory
# of the distribution package.
#
#-======================================================================
TOP = ..
include $(TOP)/configure/CONFIG
DIRS := $(DIRS) $(filter-out $(DIRS), $(wildcard *src*))
DIRS := $(DIRS) $(filter-out $(DIRS), $(wildcard *Src*))
DIRS := $(DIRS) $(filter-out $(DIRS), $(wildcard *db*))
DIRS := $(DIRS) $(filter-out $(DIRS), $(wildcard *Db*))
include $(TOP)/configure/RULES_DIRS

